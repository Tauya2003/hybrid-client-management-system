from datetime import date
from django.db.models import Sum, Count, Q
from django.utils import timezone
from rest_framework import generics, status, permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter

from .models import LoanProduct, LoanApplication, Loan, Repayment
from .serializers import (
    LoanProductSerializer,
    LoanApplicationSerializer,
    ApplicationReviewSerializer,
    DisburseSerializer,
    LoanSerializer,
    LoanListSerializer,
    RepaymentSerializer,
    RepaymentScheduleSerializer,
)
from .services import disburse_loan, apply_repayment
from apps.accounts.permissions import IsAdmin, IsAdminOrBranchManager, IsReadOnlyForAuditor


# ── Loan Products ──────────────────────────────────────────────────────────────

class LoanProductListCreateView(generics.ListCreateAPIView):
    queryset = LoanProduct.objects.filter(is_deleted=False)
    serializer_class = LoanProductSerializer
    filter_backends = [DjangoFilterBackend, SearchFilter]
    filterset_fields = ['is_active', 'interest_type', 'repayment_frequency']
    search_fields = ['name']

    def get_permissions(self):
        if self.request.method == 'POST':
            return [permissions.IsAuthenticated(), IsAdmin()]
        return [permissions.IsAuthenticated()]


class LoanProductDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = LoanProduct.objects.filter(is_deleted=False)
    serializer_class = LoanProductSerializer

    def get_permissions(self):
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated()]
        return [permissions.IsAuthenticated(), IsAdmin()]

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.soft_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# ── Loan Applications ──────────────────────────────────────────────────────────

class LoanApplicationListCreateView(generics.ListCreateAPIView):
    serializer_class = LoanApplicationSerializer
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_fields = ['status', 'loan_product', 'client']
    search_fields = ['client__first_name', 'client__last_name', 'client__national_id']
    ordering_fields = ['applied_at', 'amount_requested']
    ordering = ['-applied_at']

    def get_queryset(self):
        user = self.request.user
        qs = LoanApplication.objects.select_related('client', 'loan_product', 'applied_by', 'reviewed_by')
        if user.role == 'field_officer':
            qs = qs.filter(applied_by=user)
        elif user.role == 'branch_manager':
            qs = qs.filter(client__branch=user.branch)
        return qs.filter(is_deleted=False)

    def perform_create(self, serializer):
        serializer.save(applied_by=self.request.user)


class LoanApplicationDetailView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = LoanApplicationSerializer
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]

    def get_queryset(self):
        user = self.request.user
        qs = LoanApplication.objects.select_related('client', 'loan_product', 'applied_by')
        if user.role == 'field_officer':
            qs = qs.filter(applied_by=user)
        elif user.role == 'branch_manager':
            qs = qs.filter(client__branch=user.branch)
        return qs.filter(is_deleted=False)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.status not in ('draft', 'submitted'):
            return Response(
                {'detail': 'Only draft or submitted applications can be deleted.'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        instance.soft_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated, IsAdminOrBranchManager])
def submit_application(request, pk):
    try:
        application = LoanApplication.objects.get(pk=pk, is_deleted=False)
    except LoanApplication.DoesNotExist:
        return Response({'detail': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    if application.status != 'draft':
        return Response({'detail': 'Only draft applications can be submitted.'}, status=status.HTTP_400_BAD_REQUEST)

    application.status = 'submitted'
    application.version += 1
    application.save(update_fields=['status', 'version', 'updated_at'])
    return Response(LoanApplicationSerializer(application).data)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated, IsAdminOrBranchManager])
def approve_application(request, pk):
    try:
        application = LoanApplication.objects.get(pk=pk, is_deleted=False)
    except LoanApplication.DoesNotExist:
        return Response({'detail': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    if application.status not in ('submitted', 'under_review'):
        return Response({'detail': 'Application must be submitted or under review.'}, status=status.HTTP_400_BAD_REQUEST)

    serializer = ApplicationReviewSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    application.status = 'approved'
    application.reviewed_by = request.user
    application.reviewed_at = timezone.now()
    application.notes = serializer.validated_data.get('notes', '')
    application.version += 1
    application.save(update_fields=['status', 'reviewed_by', 'reviewed_at', 'notes', 'version', 'updated_at'])
    return Response(LoanApplicationSerializer(application).data)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated, IsAdminOrBranchManager])
def reject_application(request, pk):
    try:
        application = LoanApplication.objects.get(pk=pk, is_deleted=False)
    except LoanApplication.DoesNotExist:
        return Response({'detail': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    if application.status not in ('submitted', 'under_review'):
        return Response({'detail': 'Application must be submitted or under review.'}, status=status.HTTP_400_BAD_REQUEST)

    serializer = ApplicationReviewSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    application.status = 'rejected'
    application.reviewed_by = request.user
    application.reviewed_at = timezone.now()
    application.rejection_reason = serializer.validated_data.get('rejection_reason', '')
    application.version += 1
    application.save(update_fields=['status', 'reviewed_by', 'reviewed_at', 'rejection_reason', 'version', 'updated_at'])
    return Response(LoanApplicationSerializer(application).data)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated, IsAdminOrBranchManager])
def disburse_application(request, pk):
    try:
        application = LoanApplication.objects.get(pk=pk, is_deleted=False)
    except LoanApplication.DoesNotExist:
        return Response({'detail': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    if application.status != 'approved':
        return Response({'detail': 'Only approved applications can be disbursed.'}, status=status.HTTP_400_BAD_REQUEST)

    if hasattr(application, 'loan'):
        return Response({'detail': 'This application has already been disbursed.'}, status=status.HTTP_400_BAD_REQUEST)

    serializer = DisburseSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    disbursement_date = serializer.validated_data.get('disbursement_date') or date.today()
    loan = disburse_loan(application, request.user, disbursement_date)
    return Response(LoanSerializer(loan).data, status=status.HTTP_201_CREATED)


# ── Loans ──────────────────────────────────────────────────────────────────────

class LoanListView(generics.ListAPIView):
    serializer_class = LoanListSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_fields = ['status', 'loan_product', 'client']
    search_fields = ['loan_number', 'client__first_name', 'client__last_name', 'client__national_id']
    ordering_fields = ['disbursement_date', 'maturity_date', 'outstanding_balance']
    ordering = ['-disbursement_date']

    def get_queryset(self):
        user = self.request.user
        qs = Loan.objects.select_related('client', 'loan_product').filter(is_deleted=False)
        if user.role == 'field_officer':
            qs = qs.filter(application__applied_by=user)
        elif user.role == 'branch_manager':
            qs = qs.filter(client__branch=user.branch)
        return qs


class LoanDetailView(generics.RetrieveAPIView):
    serializer_class = LoanSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Loan.objects.select_related(
            'client', 'loan_product', 'disbursed_by', 'application'
        ).prefetch_related('schedule').filter(is_deleted=False)


# ── Repayments ────────────────────────────────────────────────────────────────

class RepaymentListCreateView(generics.ListCreateAPIView):
    serializer_class = RepaymentSerializer
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['loan', 'payment_method', 'payment_date']
    ordering_fields = ['payment_date', 'amount']
    ordering = ['-payment_date']

    def get_queryset(self):
        user = self.request.user
        qs = Repayment.objects.select_related('loan__client', 'received_by').filter(is_deleted=False)
        if user.role == 'field_officer':
            qs = qs.filter(received_by=user)
        elif user.role == 'branch_manager':
            qs = qs.filter(loan__client__branch=user.branch)
        return qs

    def perform_create(self, serializer):
        loan = serializer.validated_data['loan']
        if loan.status not in ('active',):
            from rest_framework.exceptions import ValidationError
            raise ValidationError('Repayments can only be recorded against active loans.')

        amount = serializer.validated_data['amount']
        payment_date = serializer.validated_data['payment_date']

        principal_comp, interest_comp = apply_repayment(loan, amount, payment_date)
        serializer.save(
            received_by=self.request.user,
            principal_component=principal_comp,
            interest_component=interest_comp,
        )


# ── Reports ───────────────────────────────────────────────────────────────────

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def portfolio_summary(request):
    from datetime import timedelta
    from apps.clients.models import Client, Group
    from apps.savings.models import SavingsAccount

    user = request.user
    today = date.today()

    # Base querysets scoped by role
    loan_qs = Loan.objects.filter(is_deleted=False)
    app_qs = LoanApplication.objects.filter(is_deleted=False)
    client_qs = Client.objects.filter(is_deleted=False)
    group_qs = Group.objects.filter(is_deleted=False)
    savings_qs = SavingsAccount.objects.filter(is_deleted=False, is_active=True)

    if user.role == 'branch_manager':
        loan_qs = loan_qs.filter(client__branch=user.branch)
        app_qs = app_qs.filter(client__branch=user.branch)
        client_qs = client_qs.filter(branch=user.branch)
        group_qs = group_qs.filter(branch=user.branch)
        savings_qs = savings_qs.filter(client__branch=user.branch)
    elif user.role == 'field_officer':
        loan_qs = loan_qs.filter(application__applied_by=user)
        app_qs = app_qs.filter(applied_by=user)
        client_qs = client_qs.filter(branch=user.branch)
        group_qs = group_qs.filter(branch=user.branch)
        savings_qs = savings_qs.filter(client__branch=user.branch)

    # Clients & groups
    total_clients = client_qs.count()
    active_clients = client_qs.filter(is_active=True).count()
    total_groups = group_qs.count()

    # Application status breakdown
    app_counts = {
        row['status']: row['count']
        for row in app_qs.values('status').annotate(count=Count('id'))
    }

    # Active loan financials
    active_loans = loan_qs.filter(status='active')
    loan_agg = active_loans.aggregate(
        count=Count('id'),
        total_outstanding=Sum('outstanding_balance'),
        total_disbursed=Sum('principal_amount'),
        total_repaid=Sum('amount_paid'),
    )
    total_outstanding = float(loan_agg['total_outstanding'] or 0)

    # PAR by days overdue — outstanding balance of loans with any unpaid
    # installment whose due_date is more than N days in the past
    from .models import RepaymentSchedule

    def _par_outstanding(days_back):
        cutoff = today - timedelta(days=days_back)
        at_risk_ids = (
            RepaymentSchedule.objects
            .filter(
                loan__in=active_loans,
                due_date__lt=cutoff,
                status__in=('pending', 'partial', 'overdue'),
            )
            .values_list('loan_id', flat=True)
            .distinct()
        )
        result = active_loans.filter(id__in=at_risk_ids).aggregate(
            total=Sum('outstanding_balance')
        )
        return float(result['total'] or 0)

    def _rate(amount):
        return round(amount / total_outstanding * 100, 2) if total_outstanding else 0

    par_1 = _par_outstanding(1)
    par_30 = _par_outstanding(30)
    par_60 = _par_outstanding(60)
    par_90 = _par_outstanding(90)

    # Savings totals
    savings_agg = savings_qs.aggregate(
        count=Count('id'),
        total_balance=Sum('balance'),
    )

    return Response({
        'total_clients': total_clients,
        'active_clients': active_clients,
        'total_groups': total_groups,
        'loan_applications': {
            'total': sum(app_counts.values()),
            'draft': app_counts.get('draft', 0),
            'submitted': app_counts.get('submitted', 0),
            'approved': app_counts.get('approved', 0),
            'disbursed': app_counts.get('disbursed', 0),
            'rejected': app_counts.get('rejected', 0),
        },
        'active_loans': {
            'count': loan_agg['count'] or 0,
            'total_outstanding': total_outstanding,
            'total_disbursed': float(loan_agg['total_disbursed'] or 0),
            'total_repaid': float(loan_agg['total_repaid'] or 0),
        },
        'par': {
            'par_1': par_1,
            'par_30': par_30,
            'par_60': par_60,
            'par_90': par_90,
            'par_1_rate': _rate(par_1),
            'par_30_rate': _rate(par_30),
            'par_60_rate': _rate(par_60),
            'par_90_rate': _rate(par_90),
        },
        'savings': {
            'total_accounts': savings_agg['count'] or 0,
            'total_balance': float(savings_agg['total_balance'] or 0),
        },
    })

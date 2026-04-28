from rest_framework import generics, status, permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter

from .models import SavingsAccount, SavingsTransaction
from .serializers import (
    SavingsAccountSerializer,
    SavingsAccountListSerializer,
    SavingsTransactionSerializer,
    DepositWithdrawSerializer,
)
from apps.accounts.permissions import IsReadOnlyForAuditor


class SavingsAccountListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_fields = ['account_type', 'is_active', 'client']
    search_fields = ['account_number', 'client__first_name', 'client__last_name', 'client__national_id']
    ordering_fields = ['created_at', 'balance']

    def get_queryset(self):
        user = self.request.user
        qs = SavingsAccount.objects.select_related('client').filter(is_deleted=False)
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(client__branch=user.branch)
        return qs

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return SavingsAccountListSerializer
        return SavingsAccountSerializer


class SavingsAccountDetailView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SavingsAccountSerializer
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]

    def get_queryset(self):
        user = self.request.user
        qs = SavingsAccount.objects.select_related('client').prefetch_related('transactions').filter(is_deleted=False)
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(client__branch=user.branch)
        return qs

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.balance > 0:
            return Response(
                {'detail': 'Cannot close an account with a non-zero balance.'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        instance.soft_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


def _perform_transaction(request, pk, transaction_type):
    try:
        account = SavingsAccount.objects.get(pk=pk, is_deleted=False)
    except SavingsAccount.DoesNotExist:
        return Response({'detail': 'Account not found.'}, status=status.HTTP_404_NOT_FOUND)

    if not account.is_active:
        return Response({'detail': 'Account is not active.'}, status=status.HTTP_400_BAD_REQUEST)

    serializer = DepositWithdrawSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    amount = serializer.validated_data['amount']

    if transaction_type == 'withdrawal':
        available = account.balance - account.minimum_balance
        if amount > available:
            return Response(
                {'detail': f'Insufficient funds. Available for withdrawal: {available}'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        new_balance = account.balance - amount
    else:
        new_balance = account.balance + amount

    account.balance = new_balance
    account.version += 1
    account.save(update_fields=['balance', 'version', 'updated_at'])

    txn = SavingsTransaction.objects.create(
        savings_account=account,
        transaction_type=transaction_type,
        amount=amount,
        balance_after=new_balance,
        transaction_date=serializer.validated_data['transaction_date'],
        performed_by=request.user,
        reference_number=serializer.validated_data.get('reference_number', ''),
        notes=serializer.validated_data.get('notes', ''),
    )

    return Response(SavingsTransactionSerializer(txn).data, status=status.HTTP_201_CREATED)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def deposit(request, pk):
    return _perform_transaction(request, pk, 'deposit')


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def withdraw(request, pk):
    return _perform_transaction(request, pk, 'withdrawal')


class SavingsTransactionListView(generics.ListAPIView):
    serializer_class = SavingsTransactionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['transaction_type', 'transaction_date']
    ordering_fields = ['transaction_date', 'created_at']
    ordering = ['-transaction_date']

    def get_queryset(self):
        return SavingsTransaction.objects.filter(
            savings_account_id=self.kwargs['pk'],
            is_deleted=False,
        ).select_related('performed_by')

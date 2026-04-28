from rest_framework import generics, status, permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter

from .models import Client, Group, GroupMembership
from .serializers import (
    ClientSerializer,
    ClientListSerializer,
    GroupSerializer,
    GroupListSerializer,
    GroupMembershipSerializer,
    AddMemberSerializer,
)
from apps.accounts.permissions import IsReadOnlyForAuditor


class ClientListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_fields = ['branch', 'gender', 'is_active', 'is_deleted']
    search_fields = ['first_name', 'last_name', 'national_id', 'phone_number']
    ordering_fields = ['last_name', 'created_at']
    ordering = ['last_name']

    def get_queryset(self):
        user = self.request.user
        qs = Client.objects.select_related('branch', 'created_by')
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(branch=user.branch)
        return qs.filter(is_deleted=False)

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ClientListSerializer
        return ClientSerializer

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


class ClientDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]

    def get_queryset(self):
        user = self.request.user
        qs = Client.objects.select_related('branch', 'created_by')
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(branch=user.branch)
        return qs.filter(is_deleted=False)

    def get_serializer_class(self):
        return ClientSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.soft_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class GroupListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_fields = ['branch', 'group_type', 'is_active']
    search_fields = ['name']
    ordering_fields = ['name', 'created_at']

    def get_queryset(self):
        user = self.request.user
        qs = Group.objects.select_related('branch', 'loan_officer').prefetch_related('memberships')
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(branch=user.branch)
        return qs.filter(is_deleted=False)

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return GroupListSerializer
        return GroupSerializer


class GroupDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated, IsReadOnlyForAuditor]
    serializer_class = GroupSerializer

    def get_queryset(self):
        user = self.request.user
        qs = Group.objects.select_related('branch', 'loan_officer').prefetch_related('memberships')
        if user.role in ('field_officer', 'branch_manager'):
            qs = qs.filter(branch=user.branch)
        return qs.filter(is_deleted=False)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.soft_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def add_group_member(request, pk):
    try:
        group = Group.objects.get(pk=pk, is_deleted=False)
    except Group.DoesNotExist:
        return Response({'detail': 'Group not found.'}, status=status.HTTP_404_NOT_FOUND)

    serializer = AddMemberSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    try:
        client = Client.objects.get(pk=serializer.validated_data['client_id'], is_deleted=False)
    except Client.DoesNotExist:
        return Response({'detail': 'Client not found.'}, status=status.HTTP_404_NOT_FOUND)

    membership, created = GroupMembership.objects.get_or_create(
        group=group,
        client=client,
        defaults={'role': serializer.validated_data['role']},
    )

    if not created and membership.is_deleted:
        membership.is_deleted = False
        membership.role = serializer.validated_data['role']
        membership.save()

    return Response(
        GroupMembershipSerializer(membership).data,
        status=status.HTTP_201_CREATED if created else status.HTTP_200_OK,
    )


@api_view(['DELETE'])
@permission_classes([permissions.IsAuthenticated])
def remove_group_member(request, pk, client_pk):
    try:
        membership = GroupMembership.objects.get(
            group_id=pk, client_id=client_pk, is_deleted=False
        )
    except GroupMembership.DoesNotExist:
        return Response({'detail': 'Membership not found.'}, status=status.HTTP_404_NOT_FOUND)

    membership.soft_delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

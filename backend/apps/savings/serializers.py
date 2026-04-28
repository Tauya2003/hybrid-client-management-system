from decimal import Decimal
from rest_framework import serializers
from .models import SavingsAccount, SavingsTransaction


class SavingsTransactionSerializer(serializers.ModelSerializer):
    performed_by_name = serializers.CharField(source='performed_by.full_name', read_only=True)

    class Meta:
        model = SavingsTransaction
        fields = [
            'id', 'savings_account', 'transaction_type', 'amount',
            'balance_after', 'transaction_date', 'performed_by',
            'performed_by_name', 'reference_number', 'notes',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = ['id', 'balance_after', 'performed_by', 'created_at', 'updated_at', 'version']


class SavingsAccountSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)
    transactions = SavingsTransactionSerializer(many=True, read_only=True)

    class Meta:
        model = SavingsAccount
        fields = [
            'id', 'account_number', 'client', 'client_name', 'account_type',
            'balance', 'minimum_balance', 'is_active', 'transactions',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = ['id', 'account_number', 'balance', 'created_at', 'updated_at', 'version']


class SavingsAccountListSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)

    class Meta:
        model = SavingsAccount
        fields = [
            'id', 'account_number', 'client_name', 'account_type',
            'balance', 'is_active', 'created_at',
        ]


class DepositWithdrawSerializer(serializers.Serializer):
    amount = serializers.DecimalField(max_digits=12, decimal_places=2, min_value=Decimal('0.01'))
    transaction_date = serializers.DateField()
    reference_number = serializers.CharField(required=False, allow_blank=True, default='')
    notes = serializers.CharField(required=False, allow_blank=True, default='')

from rest_framework import serializers
from .models import LoanProduct, LoanApplication, Loan, RepaymentSchedule, Repayment


class LoanProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = LoanProduct
        fields = [
            'id', 'name', 'description', 'min_amount', 'max_amount',
            'interest_rate', 'interest_type', 'repayment_frequency',
            'min_term', 'max_term', 'processing_fee_rate', 'late_penalty_rate',
            'requires_group', 'is_active', 'created_at', 'updated_at',
        ]
        read_only_fields = ['id', 'created_at', 'updated_at']


class LoanApplicationSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)
    product_name = serializers.CharField(source='loan_product.name', read_only=True)
    applied_by_name = serializers.CharField(source='applied_by.full_name', read_only=True)
    reviewed_by_name = serializers.CharField(source='reviewed_by.full_name', read_only=True)

    class Meta:
        model = LoanApplication
        fields = [
            'id', 'client', 'client_name', 'group', 'loan_product', 'product_name',
            'amount_requested', 'term', 'purpose', 'status',
            'applied_by', 'applied_by_name', 'reviewed_by', 'reviewed_by_name',
            'applied_at', 'reviewed_at', 'rejection_reason', 'notes',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = [
            'id', 'status', 'applied_by', 'reviewed_by',
            'applied_at', 'reviewed_at', 'created_at', 'updated_at', 'version',
        ]

    def validate(self, attrs):
        product = attrs.get('loan_product')
        amount = attrs.get('amount_requested')
        term = attrs.get('term')
        if product and amount:
            if amount < product.min_amount or amount > product.max_amount:
                raise serializers.ValidationError(
                    f'Amount must be between {product.min_amount} and {product.max_amount}.'
                )
        if product and term:
            if term < product.min_term or term > product.max_term:
                raise serializers.ValidationError(
                    f'Term must be between {product.min_term} and {product.max_term} periods.'
                )
        return attrs


class ApplicationReviewSerializer(serializers.Serializer):
    notes = serializers.CharField(required=False, allow_blank=True)
    rejection_reason = serializers.CharField(required=False, allow_blank=True)


class DisburseSerializer(serializers.Serializer):
    disbursement_date = serializers.DateField(required=False)


class RepaymentScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = RepaymentSchedule
        fields = [
            'id', 'installment_number', 'due_date',
            'principal_due', 'interest_due', 'total_due',
            'principal_paid', 'interest_paid', 'total_paid',
            'status',
        ]


class LoanSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)
    product_name = serializers.CharField(source='loan_product.name', read_only=True)
    disbursed_by_name = serializers.CharField(source='disbursed_by.full_name', read_only=True)
    schedule = RepaymentScheduleSerializer(many=True, read_only=True)

    class Meta:
        model = Loan
        fields = [
            'id', 'loan_number', 'client', 'client_name', 'group',
            'loan_product', 'product_name',
            'principal_amount', 'interest_amount', 'processing_fee',
            'total_amount', 'amount_paid', 'outstanding_balance',
            'disbursement_date', 'maturity_date', 'status',
            'disbursed_by', 'disbursed_by_name', 'schedule',
            'created_at', 'updated_at', 'version',
        ]
        read_only_fields = ['id', 'loan_number', 'created_at', 'updated_at', 'version']


class LoanListSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)
    product_name = serializers.CharField(source='loan_product.name', read_only=True)

    class Meta:
        model = Loan
        fields = [
            'id', 'loan_number', 'client', 'client_name', 'product_name',
            'principal_amount', 'outstanding_balance', 'status',
            'disbursement_date', 'maturity_date',
        ]


class RepaymentSerializer(serializers.ModelSerializer):
    received_by_name = serializers.CharField(source='received_by.full_name', read_only=True)
    loan_number = serializers.CharField(source='loan.loan_number', read_only=True)

    class Meta:
        model = Repayment
        fields = [
            'id', 'loan', 'loan_number', 'amount',
            'principal_component', 'interest_component',
            'payment_date', 'payment_method', 'reference_number',
            'received_by', 'received_by_name', 'notes',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = [
            'id', 'principal_component', 'interest_component',
            'received_by', 'created_at', 'updated_at', 'version',
        ]

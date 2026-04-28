from decimal import Decimal
from django.db import models
from django.utils import timezone
from utils.models import BaseModel


class LoanProduct(BaseModel):
    INTEREST_TYPES = [
        ('flat', 'Flat Rate'),
        ('reducing', 'Reducing Balance'),
    ]
    REPAYMENT_FREQUENCIES = [
        ('weekly', 'Weekly'),
        ('biweekly', 'Bi-Weekly'),
        ('monthly', 'Monthly'),
    ]

    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    min_amount = models.DecimalField(max_digits=12, decimal_places=2)
    max_amount = models.DecimalField(max_digits=12, decimal_places=2)
    interest_rate = models.DecimalField(max_digits=5, decimal_places=2, help_text='Annual interest rate (%)')
    interest_type = models.CharField(max_length=20, choices=INTEREST_TYPES)
    repayment_frequency = models.CharField(max_length=20, choices=REPAYMENT_FREQUENCIES)
    min_term = models.IntegerField(help_text='Minimum term in repayment periods')
    max_term = models.IntegerField(help_text='Maximum term in repayment periods')
    processing_fee_rate = models.DecimalField(max_digits=5, decimal_places=2, default=Decimal('0'))
    late_penalty_rate = models.DecimalField(max_digits=5, decimal_places=2, default=Decimal('0'), help_text='% of overdue amount per period')
    requires_group = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ['name']

    def __str__(self):
        return f'{self.name} ({self.interest_rate}% {self.interest_type})'

    def periods_per_year(self):
        return {'weekly': 52, 'biweekly': 26, 'monthly': 12}[self.repayment_frequency]

    def days_per_period(self):
        return {'weekly': 7, 'biweekly': 14, 'monthly': 30}[self.repayment_frequency]


class LoanApplication(BaseModel):
    STATUS_CHOICES = [
        ('draft', 'Draft'),
        ('submitted', 'Submitted'),
        ('under_review', 'Under Review'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
        ('disbursed', 'Disbursed'),
    ]

    client = models.ForeignKey('clients.Client', on_delete=models.PROTECT, related_name='loan_applications')
    group = models.ForeignKey('clients.Group', on_delete=models.SET_NULL, null=True, blank=True, related_name='loan_applications')
    loan_product = models.ForeignKey(LoanProduct, on_delete=models.PROTECT, related_name='applications')
    amount_requested = models.DecimalField(max_digits=12, decimal_places=2)
    term = models.IntegerField(help_text='Term in repayment periods')
    purpose = models.TextField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft')
    applied_by = models.ForeignKey('accounts.User', on_delete=models.PROTECT, related_name='submitted_applications')
    reviewed_by = models.ForeignKey('accounts.User', on_delete=models.SET_NULL, null=True, blank=True, related_name='reviewed_applications')
    applied_at = models.DateTimeField(auto_now_add=True)
    reviewed_at = models.DateTimeField(null=True, blank=True)
    rejection_reason = models.TextField(blank=True)
    notes = models.TextField(blank=True)

    class Meta:
        ordering = ['-applied_at']

    def __str__(self):
        return f'Application #{str(self.id)[:8]} — {self.client} ({self.status})'


class Loan(BaseModel):
    STATUS_CHOICES = [
        ('active', 'Active'),
        ('completed', 'Completed'),
        ('defaulted', 'Defaulted'),
        ('written_off', 'Written Off'),
    ]

    application = models.OneToOneField(LoanApplication, on_delete=models.PROTECT, related_name='loan')
    client = models.ForeignKey('clients.Client', on_delete=models.PROTECT, related_name='loans')
    group = models.ForeignKey('clients.Group', on_delete=models.SET_NULL, null=True, blank=True)
    loan_product = models.ForeignKey(LoanProduct, on_delete=models.PROTECT)
    loan_number = models.CharField(max_length=50, unique=True)
    principal_amount = models.DecimalField(max_digits=12, decimal_places=2)
    interest_amount = models.DecimalField(max_digits=12, decimal_places=2)
    processing_fee = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    total_amount = models.DecimalField(max_digits=12, decimal_places=2)
    amount_paid = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    outstanding_balance = models.DecimalField(max_digits=12, decimal_places=2)
    disbursement_date = models.DateField()
    maturity_date = models.DateField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='active')
    disbursed_by = models.ForeignKey('accounts.User', on_delete=models.PROTECT, related_name='disbursed_loans')

    class Meta:
        ordering = ['-disbursement_date']

    def __str__(self):
        return f'{self.loan_number} — {self.client}'

    @classmethod
    def generate_loan_number(cls):
        from datetime import date
        today = date.today()
        prefix = f'LN-{today.year}{today.month:02d}'
        count = cls.objects.filter(loan_number__startswith=prefix).count() + 1
        return f'{prefix}-{count:05d}'


class RepaymentSchedule(BaseModel):
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('paid', 'Paid'),
        ('partial', 'Partial'),
        ('overdue', 'Overdue'),
    ]

    loan = models.ForeignKey(Loan, on_delete=models.CASCADE, related_name='schedule')
    installment_number = models.IntegerField()
    due_date = models.DateField()
    principal_due = models.DecimalField(max_digits=12, decimal_places=2)
    interest_due = models.DecimalField(max_digits=12, decimal_places=2)
    total_due = models.DecimalField(max_digits=12, decimal_places=2)
    principal_paid = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    interest_paid = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    total_paid = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')

    class Meta:
        ordering = ['installment_number']
        unique_together = [['loan', 'installment_number']]


class Repayment(BaseModel):
    PAYMENT_METHODS = [
        ('cash', 'Cash'),
        ('mobile_money', 'Mobile Money'),
        ('bank_transfer', 'Bank Transfer'),
    ]

    loan = models.ForeignKey(Loan, on_delete=models.PROTECT, related_name='repayments')
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    principal_component = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    interest_component = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    payment_date = models.DateField()
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHODS, default='cash')
    reference_number = models.CharField(max_length=100, blank=True)
    received_by = models.ForeignKey('accounts.User', on_delete=models.PROTECT, related_name='collected_repayments')
    notes = models.TextField(blank=True)

    class Meta:
        ordering = ['-payment_date']

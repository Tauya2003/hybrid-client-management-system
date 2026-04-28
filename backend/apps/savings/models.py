from decimal import Decimal
from django.db import models
from utils.models import BaseModel


class SavingsAccount(BaseModel):
    ACCOUNT_TYPES = [
        ('voluntary', 'Voluntary Savings'),
        ('compulsory', 'Compulsory/Loan-Linked Savings'),
    ]

    client = models.ForeignKey('clients.Client', on_delete=models.PROTECT, related_name='savings_accounts')
    account_number = models.CharField(max_length=50, unique=True)
    account_type = models.CharField(max_length=20, choices=ACCOUNT_TYPES, default='voluntary')
    balance = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    minimum_balance = models.DecimalField(max_digits=12, decimal_places=2, default=Decimal('0'))
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f'{self.account_number} — {self.client}'

    def save(self, *args, **kwargs):
        if not self.account_number:
            self.account_number = self._generate_account_number()
        super().save(*args, **kwargs)

    def _generate_account_number(self):
        from datetime import date
        year = date.today().year
        count = SavingsAccount.objects.filter(created_at__year=year).count() + 1
        return f'SAV-{year}-{count:05d}'


class SavingsTransaction(BaseModel):
    TRANSACTION_TYPES = [
        ('deposit', 'Deposit'),
        ('withdrawal', 'Withdrawal'),
    ]

    savings_account = models.ForeignKey(SavingsAccount, on_delete=models.PROTECT, related_name='transactions')
    transaction_type = models.CharField(max_length=20, choices=TRANSACTION_TYPES)
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    balance_after = models.DecimalField(max_digits=12, decimal_places=2)
    transaction_date = models.DateField()
    performed_by = models.ForeignKey('accounts.User', on_delete=models.PROTECT, related_name='savings_transactions')
    reference_number = models.CharField(max_length=100, blank=True)
    notes = models.TextField(blank=True)

    class Meta:
        ordering = ['-transaction_date', '-created_at']

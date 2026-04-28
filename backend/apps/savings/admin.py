from django.contrib import admin
from .models import SavingsAccount, SavingsTransaction


class SavingsTransactionInline(admin.TabularInline):
    model = SavingsTransaction
    extra = 0
    readonly_fields = ['transaction_type', 'amount', 'balance_after', 'transaction_date', 'performed_by']


@admin.register(SavingsAccount)
class SavingsAccountAdmin(admin.ModelAdmin):
    list_display = ['account_number', 'client', 'account_type', 'balance', 'is_active']
    list_filter = ['account_type', 'is_active']
    search_fields = ['account_number', 'client__first_name', 'client__last_name']
    readonly_fields = ['account_number', 'balance']
    inlines = [SavingsTransactionInline]

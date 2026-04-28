from django.contrib import admin
from .models import LoanProduct, LoanApplication, Loan, RepaymentSchedule, Repayment


@admin.register(LoanProduct)
class LoanProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'interest_rate', 'interest_type', 'repayment_frequency', 'is_active']
    list_filter = ['interest_type', 'repayment_frequency', 'is_active']


class RepaymentScheduleInline(admin.TabularInline):
    model = RepaymentSchedule
    extra = 0
    readonly_fields = ['installment_number', 'due_date', 'principal_due', 'interest_due', 'total_due', 'status']


class RepaymentInline(admin.TabularInline):
    model = Repayment
    extra = 0
    readonly_fields = ['amount', 'principal_component', 'interest_component', 'payment_date', 'received_by']


@admin.register(LoanApplication)
class LoanApplicationAdmin(admin.ModelAdmin):
    list_display = ['id', 'client', 'loan_product', 'amount_requested', 'status', 'applied_at']
    list_filter = ['status', 'loan_product']
    search_fields = ['client__first_name', 'client__last_name', 'client__national_id']
    raw_id_fields = ['client', 'group', 'applied_by', 'reviewed_by']


@admin.register(Loan)
class LoanAdmin(admin.ModelAdmin):
    list_display = ['loan_number', 'client', 'principal_amount', 'outstanding_balance', 'status']
    list_filter = ['status', 'loan_product']
    search_fields = ['loan_number', 'client__first_name', 'client__last_name']
    readonly_fields = ['loan_number', 'total_amount', 'interest_amount']
    inlines = [RepaymentScheduleInline, RepaymentInline]

"""
Maps entity_type strings from the mobile client to Django models.
Only syncable entities are registered here.
"""
from apps.clients.models import Client, Group, GroupMembership
from apps.loans.models import LoanProduct, LoanApplication, Repayment
from apps.savings.models import SavingsAccount, SavingsTransaction

ENTITY_REGISTRY = {
    'loan_product': LoanProduct,       # read-only on mobile, pushed by admin via dashboard
    'client': Client,
    'group': Group,
    'group_membership': GroupMembership,
    'loan_application': LoanApplication,
    'repayment': Repayment,
    'savings_account': SavingsAccount,
    'savings_transaction': SavingsTransaction,
}

# Fields that must not be overwritten by client pushes (server-controlled)
PROTECTED_FIELDS = {
    'repayment': ['principal_component', 'interest_component', 'loan_id'],
    'savings_transaction': ['balance_after', 'savings_account_id'],
}

# Deduplication keys: if any of these conflict with an existing record,
# return the existing one rather than creating a duplicate.
DEDUP_KEYS = {
    'client': ['national_id', 'phone_number'],
    'savings_account': ['account_number'],
}

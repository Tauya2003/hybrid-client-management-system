from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User, Branch


@admin.register(Branch)
class BranchAdmin(admin.ModelAdmin):
    list_display = ['name', 'code', 'phone', 'is_active']
    list_filter = ['is_active']
    search_fields = ['name', 'code']


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    list_display = ['username', 'full_name', 'role', 'branch', 'is_active']
    list_filter = ['role', 'branch', 'is_active']
    search_fields = ['username', 'first_name', 'last_name', 'email', 'employee_id']
    fieldsets = BaseUserAdmin.fieldsets + (
        ('MFI Info', {'fields': ('role', 'branch', 'phone_number', 'employee_id')}),
    )
    add_fieldsets = BaseUserAdmin.add_fieldsets + (
        ('MFI Info', {'fields': ('role', 'branch', 'phone_number', 'employee_id')}),
    )

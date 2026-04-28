from django.contrib import admin
from .models import Client, Group, GroupMembership


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    list_display = ['full_name', 'national_id', 'phone_number', 'branch', 'is_active']
    list_filter = ['branch', 'gender', 'is_active']
    search_fields = ['first_name', 'last_name', 'national_id', 'phone_number']
    raw_id_fields = ['created_by', 'branch']


class GroupMembershipInline(admin.TabularInline):
    model = GroupMembership
    extra = 0
    raw_id_fields = ['client']


@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    list_display = ['name', 'group_type', 'branch', 'loan_officer', 'is_active']
    list_filter = ['branch', 'group_type', 'is_active']
    search_fields = ['name']
    inlines = [GroupMembershipInline]

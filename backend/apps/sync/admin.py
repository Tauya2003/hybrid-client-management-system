from django.contrib import admin
from .models import SyncLog, ConflictRecord


class ConflictRecordInline(admin.TabularInline):
    model = ConflictRecord
    extra = 0
    readonly_fields = ['entity_type', 'entity_id', 'resolution', 'created_at']


@admin.register(SyncLog)
class SyncLogAdmin(admin.ModelAdmin):
    list_display = ['user', 'device_id', 'records_pushed', 'records_pulled', 'conflicts_detected', 'status', 'synced_at']
    list_filter = ['status', 'user']
    readonly_fields = ['synced_at']
    inlines = [ConflictRecordInline]


@admin.register(ConflictRecord)
class ConflictRecordAdmin(admin.ModelAdmin):
    list_display = ['entity_type', 'entity_id', 'resolution', 'resolved_by', 'created_at']
    list_filter = ['entity_type', 'resolution']

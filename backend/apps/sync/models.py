from django.db import models
from utils.models import BaseModel


class SyncLog(BaseModel):
    SYNC_STATUS = [
        ('success', 'Success'),
        ('partial', 'Partial'),
        ('failed', 'Failed'),
    ]

    device_id = models.CharField(max_length=100)
    user = models.ForeignKey('accounts.User', on_delete=models.CASCADE, related_name='sync_logs')
    records_pushed = models.IntegerField(default=0)
    records_pulled = models.IntegerField(default=0)
    conflicts_detected = models.IntegerField(default=0)
    conflicts_resolved = models.IntegerField(default=0)
    status = models.CharField(max_length=20, choices=SYNC_STATUS, default='success')
    error_details = models.JSONField(null=True, blank=True)
    synced_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-synced_at']

    def __str__(self):
        return f'Sync by {self.user} on {self.device_id} at {self.synced_at}'


class ConflictRecord(BaseModel):
    RESOLUTION_CHOICES = [
        ('server_wins', 'Server Wins'),
        ('client_wins', 'Client Wins'),
        ('manual', 'Pending Manual Resolution'),
    ]

    sync_log = models.ForeignKey(SyncLog, on_delete=models.CASCADE, related_name='conflicts')
    entity_type = models.CharField(max_length=50)
    entity_id = models.UUIDField()
    server_data = models.JSONField()
    client_data = models.JSONField()
    resolution = models.CharField(max_length=20, choices=RESOLUTION_CHOICES)
    resolved_by = models.ForeignKey(
        'accounts.User', on_delete=models.SET_NULL,
        null=True, blank=True, related_name='resolved_conflicts',
    )
    resolved_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ['-created_at']

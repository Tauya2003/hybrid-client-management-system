from rest_framework import serializers
from .models import SyncLog, ConflictRecord


class ConflictRecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConflictRecord
        fields = [
            'id', 'entity_type', 'entity_id', 'server_data', 'client_data',
            'resolution', 'resolved_by', 'resolved_at', 'created_at',
        ]


class SyncLogSerializer(serializers.ModelSerializer):
    conflicts = ConflictRecordSerializer(many=True, read_only=True)
    user_name = serializers.CharField(source='user.full_name', read_only=True)

    class Meta:
        model = SyncLog
        fields = [
            'id', 'device_id', 'user', 'user_name',
            'records_pushed', 'records_pulled',
            'conflicts_detected', 'conflicts_resolved',
            'status', 'error_details', 'synced_at', 'conflicts',
        ]

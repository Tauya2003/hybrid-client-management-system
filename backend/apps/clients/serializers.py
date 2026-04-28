from rest_framework import serializers
from .models import Client, Group, GroupMembership


class ClientSerializer(serializers.ModelSerializer):
    full_name = serializers.CharField(read_only=True)
    branch_name = serializers.CharField(source='branch.name', read_only=True)
    created_by_name = serializers.CharField(source='created_by.full_name', read_only=True)

    class Meta:
        model = Client
        fields = [
            'id', 'national_id', 'phone_number', 'first_name', 'last_name',
            'full_name', 'date_of_birth', 'gender', 'address', 'photo',
            'next_of_kin_name', 'next_of_kin_phone', 'branch', 'branch_name',
            'created_by', 'created_by_name', 'is_active',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = ['id', 'created_at', 'updated_at', 'version']
        extra_kwargs = {
            'created_by': {'write_only': True},
            'branch': {'write_only': True},
        }


class ClientListSerializer(serializers.ModelSerializer):
    full_name = serializers.CharField(read_only=True)
    branch_name = serializers.CharField(source='branch.name', read_only=True)

    class Meta:
        model = Client
        fields = [
            'id', 'national_id', 'phone_number', 'full_name',
            'gender', 'branch_name', 'is_active', 'created_at',
        ]


class GroupMembershipSerializer(serializers.ModelSerializer):
    client_name = serializers.CharField(source='client.full_name', read_only=True)
    client_national_id = serializers.CharField(source='client.national_id', read_only=True)

    class Meta:
        model = GroupMembership
        fields = [
            'id', 'client', 'client_name', 'client_national_id',
            'role', 'joined_at', 'version', 'is_deleted',
        ]
        read_only_fields = ['id', 'joined_at']


class GroupSerializer(serializers.ModelSerializer):
    branch_name = serializers.CharField(source='branch.name', read_only=True)
    loan_officer_name = serializers.CharField(source='loan_officer.full_name', read_only=True)
    member_count = serializers.SerializerMethodField()
    memberships = GroupMembershipSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = [
            'id', 'name', 'group_type', 'branch', 'branch_name',
            'loan_officer', 'loan_officer_name', 'meeting_day',
            'meeting_frequency', 'meeting_location', 'is_active',
            'member_count', 'memberships',
            'created_at', 'updated_at', 'version', 'is_deleted',
        ]
        read_only_fields = ['id', 'created_at', 'updated_at', 'version']
        extra_kwargs = {
            'branch': {'write_only': True},
            'loan_officer': {'write_only': True},
        }

    def get_member_count(self, obj):
        return obj.memberships.filter(is_deleted=False).count()


class GroupListSerializer(serializers.ModelSerializer):
    branch_name = serializers.CharField(source='branch.name', read_only=True)
    loan_officer_name = serializers.CharField(source='loan_officer.full_name', read_only=True)
    member_count = serializers.SerializerMethodField()

    class Meta:
        model = Group
        fields = [
            'id', 'name', 'group_type', 'branch_name',
            'loan_officer_name', 'member_count', 'is_active', 'created_at',
        ]

    def get_member_count(self, obj):
        return obj.memberships.filter(is_deleted=False).count()


class AddMemberSerializer(serializers.Serializer):
    client_id = serializers.UUIDField()
    role = serializers.ChoiceField(
        choices=GroupMembership.MEMBER_ROLES,
        default='member',
    )

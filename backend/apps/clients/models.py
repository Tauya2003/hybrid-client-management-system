from django.db import models
from utils.models import BaseModel


class Client(BaseModel):
    GENDER_CHOICES = [('M', 'Male'), ('F', 'Female'), ('O', 'Other')]

    national_id = models.CharField(max_length=50, unique=True, db_index=True)
    phone_number = models.CharField(max_length=20, unique=True, db_index=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    address = models.TextField()
    photo = models.ImageField(upload_to='clients/photos/', blank=True, null=True)
    next_of_kin_name = models.CharField(max_length=200, blank=True)
    next_of_kin_phone = models.CharField(max_length=20, blank=True)
    branch = models.ForeignKey(
        'accounts.Branch',
        on_delete=models.PROTECT,
        related_name='clients',
    )
    created_by = models.ForeignKey(
        'accounts.User',
        on_delete=models.PROTECT,
        related_name='registered_clients',
    )
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ['last_name', 'first_name']
        indexes = [
            models.Index(fields=['branch', 'is_deleted']),
        ]

    def __str__(self):
        return f'{self.first_name} {self.last_name} ({self.national_id})'

    @property
    def full_name(self):
        return f'{self.first_name} {self.last_name}'


class Group(BaseModel):
    GROUP_TYPES = [
        ('solidarity', 'Solidarity Group'),
        ('individual', 'Individual Lending Group'),
    ]
    MEETING_DAYS = [
        ('MON', 'Monday'), ('TUE', 'Tuesday'), ('WED', 'Wednesday'),
        ('THU', 'Thursday'), ('FRI', 'Friday'), ('SAT', 'Saturday'),
    ]
    MEETING_FREQUENCIES = [
        ('weekly', 'Weekly'),
        ('biweekly', 'Bi-Weekly'),
        ('monthly', 'Monthly'),
    ]

    name = models.CharField(max_length=200)
    group_type = models.CharField(max_length=20, choices=GROUP_TYPES)
    branch = models.ForeignKey(
        'accounts.Branch',
        on_delete=models.PROTECT,
        related_name='groups',
    )
    loan_officer = models.ForeignKey(
        'accounts.User',
        on_delete=models.PROTECT,
        related_name='managed_groups',
    )
    meeting_day = models.CharField(max_length=3, choices=MEETING_DAYS, blank=True)
    meeting_frequency = models.CharField(max_length=20, choices=MEETING_FREQUENCIES, blank=True)
    meeting_location = models.TextField(blank=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ['name']

    def __str__(self):
        return f'{self.name} ({self.branch})'


class GroupMembership(BaseModel):
    MEMBER_ROLES = [
        ('member', 'Member'),
        ('leader', 'Group Leader'),
        ('secretary', 'Secretary'),
    ]

    group = models.ForeignKey(Group, on_delete=models.CASCADE, related_name='memberships')
    client = models.ForeignKey(Client, on_delete=models.CASCADE, related_name='group_memberships')
    role = models.CharField(max_length=20, choices=MEMBER_ROLES, default='member')
    joined_at = models.DateField(auto_now_add=True)

    class Meta:
        unique_together = [['group', 'client']]
        ordering = ['role', 'joined_at']

    def __str__(self):
        return f'{self.client} in {self.group} ({self.role})'

import uuid
from django.contrib.auth.models import AbstractUser
from django.db import models
from utils.models import BaseModel


class Branch(BaseModel):
    name = models.CharField(max_length=200)
    code = models.CharField(max_length=20, unique=True)
    address = models.TextField()
    phone = models.CharField(max_length=20, blank=True)
    email = models.EmailField(blank=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = 'branches'
        ordering = ['name']

    def __str__(self):
        return f'{self.name} ({self.code})'


class User(AbstractUser):
    ROLES = [
        ('field_officer', 'Field Officer'),
        ('branch_manager', 'Branch Manager'),
        ('admin', 'Admin'),
        ('auditor', 'Auditor'),
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    role = models.CharField(max_length=20, choices=ROLES, default='field_officer')
    branch = models.ForeignKey(
        Branch,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='members',
    )
    phone_number = models.CharField(max_length=20, blank=True)
    employee_id = models.CharField(max_length=50, unique=True, null=True, blank=True)

    class Meta:
        ordering = ['last_name', 'first_name']

    def __str__(self):
        return f'{self.get_full_name()} ({self.role})'

    @property
    def full_name(self):
        return self.get_full_name() or self.username

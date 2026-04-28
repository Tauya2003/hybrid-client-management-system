import uuid
from django.db import models


class BaseModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False, db_index=True)
    version = models.IntegerField(default=1)

    class Meta:
        abstract = True

    def soft_delete(self):
        self.is_deleted = True
        self.version += 1
        self.save(update_fields=['is_deleted', 'version', 'updated_at'])

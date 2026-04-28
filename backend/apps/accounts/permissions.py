from rest_framework.permissions import BasePermission


class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'admin'


class IsAdminOrBranchManager(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in ('admin', 'branch_manager')


class IsFieldOfficerOrAbove(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in (
            'field_officer', 'branch_manager', 'admin'
        )


class IsReadOnlyForAuditor(BasePermission):
    """Auditors get read-only access; other authenticated users get full access."""

    SAFE_METHODS = ('GET', 'HEAD', 'OPTIONS')

    def has_permission(self, request, view):
        if not request.user.is_authenticated:
            return False
        if request.user.role == 'auditor':
            return request.method in self.SAFE_METHODS
        return True


class IsSameBranchOrAdmin(BasePermission):
    """Restrict field officers to their own branch's data."""

    def has_object_permission(self, request, view, obj):
        user = request.user
        if user.role in ('admin',):
            return True
        branch_id = getattr(obj, 'branch_id', None)
        if branch_id is None:
            # Try nested branch
            branch_id = getattr(getattr(obj, 'branch', None), 'id', None)
        return branch_id == user.branch_id

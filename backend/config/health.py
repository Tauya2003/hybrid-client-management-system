import logging

from django.conf import settings
from django.http import JsonResponse

logger = logging.getLogger(__name__)


def health(request):
    """Liveness check. Optional CORS/host echo when LOG_CORS_BOOTSTRAP or DEBUG is on."""
    data = {'status': 'ok'}
    if getattr(settings, 'CORS_BOOTSTRAP_DIAGNOSTIC', False):
        data['debug'] = settings.DEBUG
        data['allowed_hosts'] = list(settings.ALLOWED_HOSTS)
        data['cors_allowed_origins'] = list(settings.CORS_ALLOWED_ORIGINS)
        logger.info(
            'health diagnostic requested (path=%s origin=%s)',
            request.path,
            request.headers.get('Origin', ''),
        )
    return JsonResponse(data)

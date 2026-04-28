from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from drf_spectacular.views import SpectacularAPIView, SpectacularSwaggerView, SpectacularRedocView

urlpatterns = [
    path('admin/', admin.site.urls),

    # API schema
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('api/docs/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),

    # App routes
    path('api/auth/', include('apps.accounts.urls')),
    path('api/', include('apps.clients.urls')),
    path('api/', include('apps.loans.urls')),
    path('api/', include('apps.savings.urls')),
    path('api/sync/', include('apps.sync.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

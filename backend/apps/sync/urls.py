from django.urls import path
from . import views

urlpatterns = [
    path('push/', views.push, name='sync-push'),
    path('pull/', views.pull, name='sync-pull'),
]

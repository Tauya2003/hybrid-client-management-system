from django.urls import path
from . import views

urlpatterns = [
    path('clients/', views.ClientListCreateView.as_view(), name='client-list'),
    path('clients/<uuid:pk>/', views.ClientDetailView.as_view(), name='client-detail'),
    path('groups/', views.GroupListCreateView.as_view(), name='group-list'),
    path('groups/<uuid:pk>/', views.GroupDetailView.as_view(), name='group-detail'),
    path('groups/<uuid:pk>/members/', views.add_group_member, name='group-add-member'),
    path('groups/<uuid:pk>/members/<uuid:client_pk>/', views.remove_group_member, name='group-remove-member'),
]

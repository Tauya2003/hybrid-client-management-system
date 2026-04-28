from django.urls import path
from . import views

urlpatterns = [
    path('savings/', views.SavingsAccountListCreateView.as_view(), name='savings-list'),
    path('savings/<uuid:pk>/', views.SavingsAccountDetailView.as_view(), name='savings-detail'),
    path('savings/<uuid:pk>/deposit/', views.deposit, name='savings-deposit'),
    path('savings/<uuid:pk>/withdraw/', views.withdraw, name='savings-withdraw'),
    path('savings/<uuid:pk>/transactions/', views.SavingsTransactionListView.as_view(), name='savings-transactions'),
]

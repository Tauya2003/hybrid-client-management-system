from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.LoginView.as_view(), name='auth-login'),
    path('refresh/', views.TokenRefreshViewCustom.as_view(), name='auth-refresh'),
    path('logout/', views.logout_view, name='auth-logout'),
    path('me/', views.me_view, name='auth-me'),
    path('change-password/', views.change_password_view, name='auth-change-password'),
    path('branches/', views.BranchListCreateView.as_view(), name='branch-list'),
    path('branches/<uuid:pk>/', views.BranchDetailView.as_view(), name='branch-detail'),
    path('users/', views.UserListCreateView.as_view(), name='user-list'),
    path('users/<uuid:pk>/', views.UserDetailView.as_view(), name='user-detail'),
]

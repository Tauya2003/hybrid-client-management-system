from django.urls import path
from . import views

urlpatterns = [
    # Loan products
    path('loan-products/', views.LoanProductListCreateView.as_view(), name='loan-product-list'),
    path('loan-products/<uuid:pk>/', views.LoanProductDetailView.as_view(), name='loan-product-detail'),

    # Loan applications
    path('loan-applications/', views.LoanApplicationListCreateView.as_view(), name='loan-application-list'),
    path('loan-applications/<uuid:pk>/', views.LoanApplicationDetailView.as_view(), name='loan-application-detail'),
    path('loan-applications/<uuid:pk>/submit/', views.submit_application, name='loan-application-submit'),
    path('loan-applications/<uuid:pk>/approve/', views.approve_application, name='loan-application-approve'),
    path('loan-applications/<uuid:pk>/reject/', views.reject_application, name='loan-application-reject'),
    path('loan-applications/<uuid:pk>/disburse/', views.disburse_application, name='loan-application-disburse'),

    # Loans
    path('loans/', views.LoanListView.as_view(), name='loan-list'),
    path('loans/<uuid:pk>/', views.LoanDetailView.as_view(), name='loan-detail'),

    # Repayments
    path('repayments/', views.RepaymentListCreateView.as_view(), name='repayment-list'),

    # Reports
    path('reports/portfolio/', views.portfolio_summary, name='report-portfolio'),
]

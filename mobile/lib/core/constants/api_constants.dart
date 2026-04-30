class ApiConstants {
  static const String baseUrl = 'https://api.hcms.loficode.tech/api';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Auth
  static const String login = '/auth/login/';
  static const String refresh = '/auth/refresh/';
  static const String logout = '/auth/logout/';
  static const String me = '/auth/me/';

  // Clients
  static const String clients = '/clients/';

  // Groups
  static const String groups = '/groups/';

  // Loan products
  static const String loanProducts = '/loan-products/';

  // Loan applications
  static const String loanApplications = '/loan-applications/';

  // Loans
  static const String loans = '/loans/';

  // Repayments
  static const String repayments = '/repayments/';

  // Savings
  static const String savings = '/savings/';

  // Sync
  static const String syncPush = '/sync/push/';
  static const String syncPull = '/sync/pull/';

  // Reports
  static const String portfolioReport = '/reports/portfolio/';
}

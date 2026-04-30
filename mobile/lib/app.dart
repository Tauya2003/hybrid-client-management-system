import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/clients/client_list_screen.dart';
import 'presentation/screens/clients/client_detail_screen.dart';
import 'presentation/screens/clients/client_form_screen.dart';
import 'presentation/screens/groups/group_list_screen.dart';
import 'presentation/screens/loans/loan_list_screen.dart';
import 'presentation/screens/loans/loan_detail_screen.dart';
import 'presentation/screens/loans/loan_application_form_screen.dart';
import 'presentation/screens/loans/repayment_form_screen.dart';
import 'presentation/screens/savings/savings_screen.dart';

final _routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoginPage = state.matchedLocation == '/login';
      if (!isLoggedIn && !isLoginPage) return '/login';
      if (isLoggedIn && isLoginPage) return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),

      // Clients
      GoRoute(path: '/clients', builder: (_, __) => const ClientListScreen()),
      GoRoute(path: '/clients/new', builder: (_, __) => const ClientFormScreen()),
      GoRoute(
        path: '/clients/:id',
        builder: (_, state) => ClientDetailScreen(clientId: state.pathParameters['id']!),
      ),

      // Groups
      GoRoute(path: '/groups', builder: (_, __) => const GroupListScreen()),

      // Loans
      GoRoute(path: '/loans', builder: (_, __) => const LoanListScreen()),
      GoRoute(
        path: '/loans/new',
        builder: (_, state) => LoanApplicationFormScreen(
          clientId: state.uri.queryParameters['clientId'],
        ),
      ),
      GoRoute(
        path: '/loans/:id',
        builder: (_, state) => LoanDetailScreen(loanId: state.pathParameters['id']!),
      ),

      // Repayments
      GoRoute(
        path: '/repayments/new',
        builder: (_, state) => RepaymentFormScreen(
          loanId: state.uri.queryParameters['loanId'],
        ),
      ),

      // Savings
      GoRoute(path: '/savings', builder: (_, __) => const SavingsListScreen()),
      GoRoute(
        path: '/savings/:id',
        builder: (_, state) => SavingsDetailScreen(accountId: state.pathParameters['id']!),
      ),
    ],
  );
});

class MFIApp extends ConsumerWidget {
  const MFIApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(_routerProvider);

    return MaterialApp.router(
      title: 'MFI Connect',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1565C0),
        appBarTheme: const AppBarTheme(centerTitle: false),
        cardTheme: CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

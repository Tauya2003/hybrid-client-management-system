import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../providers/loan_provider.dart';
import '../../widgets/common/app_widgets.dart';

class LoanListScreen extends ConsumerWidget {
  const LoanListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final loansAsync = ref.watch(loansProvider(null));
    final applicationsAsync = ref.watch(loanApplicationsProvider(null));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loans'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Active Loans'),
            Tab(text: 'Applications'),
          ]),
        ),
        body: Column(
          children: [
            const SyncStatusBanner(),
            Expanded(
              child: TabBarView(
                children: [
                  // Active loans tab
                  loansAsync.when(
                    loading: () => const LoadingIndicator(),
                    error: (e, _) => Center(child: Text('Error: $e')),
                    data: (loans) {
                      final active = loans.where((l) => l.status == 'active').toList();
                      if (active.isEmpty) {
                        return const EmptyState(
                          icon: Icons.account_balance_wallet_outlined,
                          title: 'No active loans',
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: active.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) {
                          final loan = active[i];
                          final progress = loan.totalAmount > 0
                              ? loan.amountPaid / loan.totalAmount
                              : 0.0;
                          return Card(
                            child: InkWell(
                              onTap: () => context.push('/loans/${loan.id}'),
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(loan.loanNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(
                                          '\$${loan.outstandingBalance.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Due: ${loan.maturityDate}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(value: progress.toDouble()),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${loan.amountPaid.toStringAsFixed(2)} of \$${loan.totalAmount.toStringAsFixed(2)} paid',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // Applications tab
                  applicationsAsync.when(
                    loading: () => const LoadingIndicator(),
                    error: (e, _) => Center(child: Text('Error: $e')),
                    data: (apps) {
                      if (apps.isEmpty) {
                        return EmptyState(
                          icon: Icons.description_outlined,
                          title: 'No loan applications',
                          action: user?.canWrite == true
                              ? FilledButton.icon(
                                  onPressed: () => context.push('/loans/new'),
                                  icon: const Icon(Icons.add),
                                  label: const Text('New Application'),
                                )
                              : null,
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: apps.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) {
                          final app = apps[i];
                          return Card(
                            child: ListTile(
                              title: Text(app.loanProductName.isNotEmpty
                                  ? app.loanProductName
                                  : 'Loan Application'),
                              subtitle: Text(
                                '\$${app.amountRequested.toStringAsFixed(2)} • ${app.term} periods',
                              ),
                              trailing: _AppStatusChip(app.status),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: user?.canWrite == true
            ? FloatingActionButton.extended(
                onPressed: () => context.push('/loans/new'),
                icon: const Icon(Icons.add),
                label: const Text('New Application'),
              )
            : null,
      ),
    );
  }
}

class _AppStatusChip extends StatelessWidget {
  final String status;
  const _AppStatusChip(this.status);

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      'draft' => (Colors.grey, 'Draft'),
      'submitted' => (Colors.blue, 'Submitted'),
      'under_review' => (Colors.orange, 'Under Review'),
      'approved' => (Colors.green, 'Approved'),
      'rejected' => (Colors.red, 'Rejected'),
      'disbursed' => (Colors.teal, 'Disbursed'),
      _ => (Colors.grey, status),
    };
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 10, color: Colors.white)),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

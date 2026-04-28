import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/loan_provider.dart';
import '../../widgets/common/app_widgets.dart';

class LoanDetailScreen extends ConsumerWidget {
  final String loanId;
  const LoanDetailScreen({super.key, required this.loanId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loanAsync = ref.watch(loanDetailProvider(loanId));
    final scheduleAsync = ref.watch(scheduleProvider(loanId));

    return Scaffold(
      appBar: AppBar(title: const Text('Loan Details')),
      body: loanAsync.when(
        loading: () => const LoadingIndicator(),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (loan) {
          if (loan == null) return const Center(child: Text('Loan not found'));
          final theme = Theme.of(context);
          final progress = loan.totalAmount > 0 ? loan.amountPaid / loan.totalAmount : 0.0;

          return Column(
            children: [
              const SyncStatusBanner(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Summary card
                    Card(
                      color: theme.colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(loan.loanNumber, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('Status: ${loan.status.toUpperCase()}', style: theme.textTheme.bodySmall),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _AmountLabel(label: 'Principal', amount: loan.principalAmount),
                                _AmountLabel(label: 'Interest', amount: loan.interestAmount),
                                _AmountLabel(label: 'Total', amount: loan.totalAmount),
                              ],
                            ),
                            const SizedBox(height: 16),
                            LinearProgressIndicator(
                              value: progress.toDouble(),
                              backgroundColor: Colors.white30,
                              color: Colors.green,
                              minHeight: 8,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${loan.amountPaid.toStringAsFixed(2)} paid of \$${loan.totalAmount.toStringAsFixed(2)}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Details', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                            const Divider(),
                            InfoRow(label: 'Disbursed', value: loan.disbursementDate),
                            InfoRow(label: 'Maturity', value: loan.maturityDate),
                            InfoRow(
                              label: 'Outstanding',
                              value: '\$${loan.outstandingBalance.toStringAsFixed(2)}',
                              valueColor: theme.colorScheme.error,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Repayment schedule
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Repayment Schedule', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                            const Divider(),
                            scheduleAsync.when(
                              loading: () => const LinearProgressIndicator(),
                              error: (_, __) => const Text('Failed to load schedule'),
                              data: (schedule) {
                                if (schedule.isEmpty) return const Text('No schedule available');
                                return Column(
                                  children: schedule.map((s) {
                                    final isPaid = s.status == 'paid';
                                    final isOverdue = s.status == 'overdue';
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: isPaid
                                            ? Colors.green
                                            : isOverdue
                                                ? Colors.red
                                                : Colors.grey.shade300,
                                        child: Text(
                                          '${s.installmentNumber}',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: isPaid || isOverdue ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                      title: Text(s.dueDate),
                                      subtitle: Text('\$${s.totalDue.toStringAsFixed(2)} due'),
                                      trailing: isPaid
                                          ? const Icon(Icons.check_circle, color: Colors.green)
                                          : isOverdue
                                              ? const Icon(Icons.warning, color: Colors.red)
                                              : null,
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/repayments/new?loanId=$loanId'),
        icon: const Icon(Icons.payments),
        label: const Text('Record Repayment'),
      ),
    );
  }
}

class _AmountLabel extends StatelessWidget {
  final String label;
  final double amount;

  const _AmountLabel({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${amount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

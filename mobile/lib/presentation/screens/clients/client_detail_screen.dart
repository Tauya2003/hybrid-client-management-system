import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/client_provider.dart';
import '../../providers/loan_provider.dart';
import '../../providers/savings_provider.dart';
import '../../widgets/common/app_widgets.dart';

class ClientDetailScreen extends ConsumerWidget {
  final String clientId;
  const ClientDetailScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientAsync = ref.watch(clientDetailProvider(clientId));
    final loansAsync = ref.watch(loansProvider(clientId));
    final savingsAsync = ref.watch(savingsAccountsProvider(clientId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Profile'),
      ),
      body: clientAsync.when(
        loading: () => const LoadingIndicator(),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (client) {
          if (client == null) return const Center(child: Text('Client not found'));
          final theme = Theme.of(context);
          return Column(
            children: [
              const SyncStatusBanner(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Header card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: theme.colorScheme.primaryContainer,
                              child: Text(
                                client.firstName.isNotEmpty ? client.firstName[0].toUpperCase() : '?',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${client.firstName} ${client.lastName}',
                                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(client.nationalId, style: theme.textTheme.bodySmall),
                                  SyncBadge(isPending: client.syncStatus == 'pending'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Details
                    _SectionCard(title: 'Personal Details', children: [
                      InfoRow(label: 'Phone', value: client.phoneNumber),
                      InfoRow(label: 'Gender', value: client.gender == 'M' ? 'Male' : client.gender == 'F' ? 'Female' : 'Other'),
                      InfoRow(label: 'Date of Birth', value: client.dateOfBirth),
                      InfoRow(label: 'Address', value: client.address),
                    ]),
                    const SizedBox(height: 12),
                    if (client.nextOfKinName.isNotEmpty)
                      _SectionCard(title: 'Next of Kin', children: [
                        InfoRow(label: 'Name', value: client.nextOfKinName),
                        InfoRow(label: 'Phone', value: client.nextOfKinPhone),
                      ]),
                    const SizedBox(height: 12),

                    // Loans
                    _SectionCard(
                      title: 'Loans',
                      trailing: TextButton(
                        onPressed: () => context.push('/loans/new?clientId=$clientId'),
                        child: const Text('+ New Application'),
                      ),
                      children: [
                        loansAsync.when(
                          loading: () => const LinearProgressIndicator(),
                          error: (_, __) => const Text('Failed to load loans'),
                          data: (loans) {
                            if (loans.isEmpty) return const Text('No loans', style: TextStyle(color: Colors.grey));
                            return Column(
                              children: loans.map((l) => ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(l.loanNumber),
                                subtitle: Text('Balance: \$${l.outstandingBalance.toStringAsFixed(2)}'),
                                trailing: _LoanStatusChip(l.status),
                                onTap: () => context.push('/loans/${l.id}'),
                              )).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Savings
                    _SectionCard(
                      title: 'Savings Accounts',
                      children: [
                        savingsAsync.when(
                          loading: () => const LinearProgressIndicator(),
                          error: (_, __) => const Text('Failed to load savings'),
                          data: (accounts) {
                            if (accounts.isEmpty) return const Text('No savings accounts', style: TextStyle(color: Colors.grey));
                            return Column(
                              children: accounts.map((a) => ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(a.accountNumber),
                                subtitle: Text(a.accountType),
                                trailing: Text(
                                  '\$${a.balance.toStringAsFixed(2)}',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () => context.push('/savings/${a.id}'),
                              )).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget? trailing;

  const _SectionCard({required this.title, required this.children, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                if (trailing != null) trailing!,
              ],
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _LoanStatusChip extends StatelessWidget {
  final String status;
  const _LoanStatusChip(this.status);

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      'active' => Colors.green,
      'completed' => Colors.blue,
      'defaulted' => Colors.red,
      _ => Colors.grey,
    };
    return Chip(
      label: Text(status, style: const TextStyle(fontSize: 10, color: Colors.white)),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

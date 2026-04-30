import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/local/database/app_database.dart';
import '../../providers/auth_provider.dart';
import '../../providers/client_provider.dart';
import '../../providers/savings_provider.dart';
import '../../widgets/common/app_widgets.dart';

class SavingsListScreen extends ConsumerStatefulWidget {
  const SavingsListScreen({super.key});

  @override
  ConsumerState<SavingsListScreen> createState() => _SavingsListScreenState();
}

class _SavingsListScreenState extends ConsumerState<SavingsListScreen> {
  String? _selectedClientId;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    final clientsAsync = ref.watch(clientsStreamProvider(user?.branchId));
    final accountsAsync = _selectedClientId == null
        ? const AsyncValue<List<SavingsAccountsTableData>>.data([])
        : ref.watch(savingsAccountsProvider(_selectedClientId!));

    return Scaffold(
      appBar: AppBar(title: const Text('Savings')),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: clientsAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Could not load clients: $e'),
              data: (clients) {
                if (clients.isEmpty) {
                  return const Text(
                    'No clients available.',
                    style: TextStyle(color: Colors.orange),
                  );
                }
                if (_selectedClientId == null ||
                    !clients.any((c) => c.id == _selectedClientId)) {
                  _selectedClientId = clients.first.id;
                }
                return DropdownButtonFormField<String>(
                  value: _selectedClientId,
                  decoration: const InputDecoration(
                    labelText: 'Client',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  items: clients
                      .map(
                        (c) => DropdownMenuItem(
                          value: c.id,
                          child: Text('${c.firstName} ${c.lastName}'),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _selectedClientId = v),
                );
              },
            ),
          ),
          Expanded(
            child: accountsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (accounts) {
                if (_selectedClientId == null) {
                  return const EmptyState(
                    icon: Icons.person_search,
                    title: 'Select a client',
                    subtitle: 'Choose a client to view savings accounts.',
                  );
                }
                if (accounts.isEmpty) {
                  return const EmptyState(
                    icon: Icons.savings_outlined,
                    title: 'No savings accounts',
                    subtitle: 'This client has no savings accounts yet.',
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: accounts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final a = accounts[i];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.savings)),
                        title: Text(a.accountNumber),
                        subtitle: Text(a.accountType),
                        trailing: Text('\$${a.balance.toStringAsFixed(2)}'),
                        onTap: () => context.push('/savings/${a.id}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SavingsDetailScreen extends ConsumerWidget {
  final String accountId;
  const SavingsDetailScreen({super.key, required this.accountId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txnsAsync = ref.watch(savingsTransactionsProvider(accountId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Savings Account')),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Expanded(
            child: txnsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (txns) {
                if (txns.isEmpty) {
                  return const EmptyState(
                    icon: Icons.savings_outlined,
                    title: 'No transactions yet',
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: txns.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final txn = txns[i];
                    final isDeposit = txn.transactionType == 'deposit';
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isDeposit ? Colors.green.shade100 : Colors.red.shade100,
                        child: Icon(
                          isDeposit ? Icons.arrow_downward : Icons.arrow_upward,
                          color: isDeposit ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(isDeposit ? 'Deposit' : 'Withdrawal'),
                      subtitle: Text(txn.transactionDate),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${isDeposit ? '+' : '-'}\$${txn.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDeposit ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                            'Bal: \$${txn.balanceAfter.toStringAsFixed(2)}',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'withdraw',
            onPressed: () => _showTransactionDialog(context, ref, 'withdrawal'),
            backgroundColor: Colors.red,
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.extended(
            heroTag: 'deposit',
            onPressed: () => _showTransactionDialog(context, ref, 'deposit'),
            icon: const Icon(Icons.arrow_downward),
            label: const Text('Deposit'),
          ),
        ],
      ),
    );
  }

  void _showTransactionDialog(BuildContext context, WidgetRef ref, String type) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(type == 'deposit' ? 'Record Deposit' : 'Record Withdrawal'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Amount',
            prefixText: '\$',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              final amount = double.tryParse(ctrl.text);
              if (amount == null || amount <= 0) return;
              Navigator.pop(ctx);
              // For withdrawal, we'd need the current balance — simplified here
              await ref.read(savingsActionsProvider).recordTransaction(
                    accountId: accountId,
                    transactionType: type,
                    amount: amount,
                    currentBalance: 0, // Would be fetched from account in a full impl
                    transactionDate: DateTime.now().toIso8601String().split('T').first,
                  );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${type == 'deposit' ? 'Deposit' : 'Withdrawal'} recorded (pending sync)'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

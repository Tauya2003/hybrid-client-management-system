import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/common/app_widgets.dart';
import '../../../sync/sync_engine.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _syncSpinController;

  @override
  void initState() {
    super.initState();
    _syncSpinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _syncSpinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final syncStatus = ref.watch(syncStatusProvider);
    final isSyncing = syncStatus == SyncStatus.syncing;
    final user = auth.user;
    final theme = Theme.of(context);

    if (isSyncing) {
      if (!_syncSpinController.isAnimating) {
        _syncSpinController.repeat();
      }
    } else {
      if (_syncSpinController.isAnimating) {
        _syncSpinController.stop();
      }
      _syncSpinController.value = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: RotationTransition(
              turns: _syncSpinController,
              child: const Icon(Icons.sync),
            ),
            tooltip: isSyncing ? 'Syncing...' : 'Sync now',
            onPressed: isSyncing
                ? null
                : () async {
              final result = await ref.read(syncEngineProvider).triggerSync();
              if (context.mounted) {
                final msg = result.errors > 0
                    ? 'Sync failed: ${result.message ?? "unknown error"}'
                    : 'Synced — pushed ${result.pushed} record(s)';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(msg),
                  backgroundColor:
                      result.errors > 0 ? Colors.red : Colors.green,
                  duration: const Duration(seconds: 4),
                ));
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Welcome card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${user?.firstName ?? 'Officer'}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user?.branchName != null ? 'Branch: ${user!.branchName}' : user?.role ?? '',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Quick actions
                Text('Quick Actions', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                  children: [
                    _QuickActionCard(
                      icon: Icons.person_add,
                      label: 'Register Client',
                      color: Colors.blue,
                      onTap: () => context.push('/clients/new'),
                    ),
                    _QuickActionCard(
                      icon: Icons.description,
                      label: 'New Loan Application',
                      color: Colors.green,
                      onTap: () => context.push('/loans/new'),
                    ),
                    _QuickActionCard(
                      icon: Icons.payments,
                      label: 'Record Repayment',
                      color: Colors.orange,
                      onTap: () => context.push('/repayments/new'),
                    ),
                    _QuickActionCard(
                      icon: Icons.savings,
                      label: 'Savings Deposit',
                      color: Colors.purple,
                      onTap: () => context.push('/savings'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Navigation cards
                Text('Manage', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                _NavCard(
                  icon: Icons.people,
                  title: 'Clients',
                  subtitle: 'View and manage all clients',
                  onTap: () => context.go('/clients'),
                ),
                const SizedBox(height: 8),
                _NavCard(
                  icon: Icons.group,
                  title: 'Groups',
                  subtitle: 'Solidarity and lending groups',
                  onTap: () => context.go('/groups'),
                ),
                const SizedBox(height: 8),
                _NavCard(
                  icon: Icons.account_balance_wallet,
                  title: 'Loans',
                  subtitle: 'Applications, active loans & repayments',
                  onTap: () => context.go('/loans'),
                ),
                const SizedBox(height: 8),
                _NavCard(
                  icon: Icons.savings,
                  title: 'Savings',
                  subtitle: 'Savings accounts & transactions',
                  onTap: () => context.go('/savings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _NavCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

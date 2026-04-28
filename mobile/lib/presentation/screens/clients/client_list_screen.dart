import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../providers/client_provider.dart';
import '../../widgets/common/app_widgets.dart';

class ClientListScreen extends ConsumerStatefulWidget {
  const ClientListScreen({super.key});

  @override
  ConsumerState<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends ConsumerState<ClientListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    final clientsAsync = ref.watch(clientsStreamProvider(user?.branchId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, ID, or phone…',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (v) => setState(() => _search = v.toLowerCase()),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Expanded(
            child: clientsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (clients) {
                final filtered = _search.isEmpty
                    ? clients
                    : clients.where((c) {
                        final name = '${c.firstName} ${c.lastName}'.toLowerCase();
                        return name.contains(_search) ||
                            c.nationalId.toLowerCase().contains(_search) ||
                            c.phoneNumber.contains(_search);
                      }).toList();

                if (filtered.isEmpty) {
                  return EmptyState(
                    icon: Icons.people_outline,
                    title: 'No clients found',
                    subtitle: _search.isEmpty ? 'Register your first client using the button below.' : null,
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final c = filtered[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            c.firstName.isNotEmpty ? c.firstName[0].toUpperCase() : '?',
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                          ),
                        ),
                        title: Text('${c.firstName} ${c.lastName}'),
                        subtitle: Text('${c.nationalId} • ${c.phoneNumber}'),
                        trailing: c.syncStatus == 'pending'
                            ? const Icon(Icons.cloud_upload_outlined, color: Colors.orange, size: 18)
                            : const Icon(Icons.chevron_right),
                        onTap: () => context.push('/clients/${c.id}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: user?.canWrite == true
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/clients/new'),
              icon: const Icon(Icons.person_add),
              label: const Text('Register Client'),
            )
          : null,
    );
  }
}

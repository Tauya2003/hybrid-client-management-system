import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';
import '../../providers/database_provider.dart';
import '../../widgets/common/app_widgets.dart';

class GroupListScreen extends ConsumerWidget {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final db = ref.watch(databaseProvider);
    final groupsStream = db.groupsDao.watchGroups(branchId: user?.branchId);

    return Scaffold(
      appBar: AppBar(title: const Text('Groups')),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Expanded(
            child: StreamBuilder(
              stream: groupsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final groups = snapshot.data ?? [];
                if (groups.isEmpty) {
                  return const EmptyState(
                    icon: Icons.group_outlined,
                    title: 'No groups yet',
                    subtitle: 'Groups synced from the server will appear here.',
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: groups.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final g = groups[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            g.name.isNotEmpty ? g.name[0].toUpperCase() : 'G',
                          ),
                        ),
                        title: Text(g.name),
                        subtitle: Text(g.groupType),
                        trailing: g.syncStatus == 'pending'
                            ? const Icon(
                                Icons.cloud_upload_outlined,
                                color: Colors.orange,
                                size: 18,
                              )
                            : const Icon(Icons.chevron_right),
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

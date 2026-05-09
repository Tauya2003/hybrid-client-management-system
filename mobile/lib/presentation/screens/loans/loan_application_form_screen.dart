import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/client_provider.dart';
import '../../providers/loan_provider.dart';
import '../../providers/database_provider.dart';
import '../../../data/local/database/app_database.dart';

class LoanApplicationFormScreen extends ConsumerStatefulWidget {
  final String? clientId;
  const LoanApplicationFormScreen({super.key, this.clientId});

  @override
  ConsumerState<LoanApplicationFormScreen> createState() =>
      _LoanApplicationFormScreenState();
}

class _LoanApplicationFormScreenState
    extends ConsumerState<LoanApplicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _termCtrl = TextEditingController();
  final _purposeCtrl = TextEditingController();

  ClientsTableData? _selectedClient;
  LoanProductsTableData? _selectedProduct;
  bool _saving = false;
  String? _clientSearch;

  @override
  void initState() {
    super.initState();
    if (widget.clientId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final db = ref.read(databaseProvider);
        final client = await db.clientsDao.getClientById(widget.clientId!);
        if (mounted && client != null) setState(() => _selectedClient = client);
      });
    }
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _termCtrl.dispose();
    _purposeCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedClient == null) {
      _showError('Please select a client.');
      return;
    }
    if (_selectedProduct == null) {
      _showError('Please select a loan product.');
      return;
    }

    setState(() => _saving = true);
    try {
      await ref.read(loanApplicationActionsProvider).createApplication(
            clientId: _selectedClient!.id,
            loanProductId: _selectedProduct!.id,
            loanProductName: _selectedProduct!.name,
            amountRequested: double.parse(_amountCtrl.text.trim()),
            term: int.parse(_termCtrl.text.trim()),
            purpose: _purposeCtrl.text.trim(),
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Application saved (pending sync)'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) _showError('Error: $e');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clientsAsync = ref.watch(clientsStreamProvider(null));
    final productsAsync = ref.watch(loanProductsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('New Loan Application')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _SectionHeader('Client'),
            clientsAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error loading clients: $e'),
              data: (clients) {
                final filtered = _clientSearch == null || _clientSearch!.isEmpty
                    ? clients
                    : clients
                        .where((c) =>
                            '${c.firstName} ${c.lastName} ${c.nationalId}'
                                .toLowerCase()
                                .contains(_clientSearch!.toLowerCase()))
                        .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Search client',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (v) => setState(() => _clientSearch = v),
                    ),
                    const SizedBox(height: 8),
                    if (_selectedClient != null)
                      _SelectedCard(
                        label:
                            '${_selectedClient!.firstName} ${_selectedClient!.lastName}',
                        sub: _selectedClient!.nationalId,
                        onClear: () => setState(() => _selectedClient = null),
                      )
                    else if (filtered.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text('No clients found.',
                            style: TextStyle(color: Colors.grey)),
                      )
                    else
                      ...filtered.take(5).map((c) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              child: Text(c.firstName[0].toUpperCase()),
                            ),
                            title: Text('${c.firstName} ${c.lastName}'),
                            subtitle: Text(c.nationalId),
                            onTap: () => setState(() {
                              _selectedClient = c;
                              _clientSearch = null;
                            }),
                          )),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            const _SectionHeader('Loan Product'),
            productsAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error loading products: $e'),
              data: (products) {
                if (products.isEmpty) {
                  return const Text(
                    'No loan products available. Ask your admin to create one.',
                    style: TextStyle(color: Colors.grey),
                  );
                }
                return DropdownButtonFormField<LoanProductsTableData>(
                  decoration: const InputDecoration(
                    labelText: 'Select product',
                    prefixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(),
                  ),
                  items: products
                      .map((p) => DropdownMenuItem(
                            value: p,
                            child: Text(p.name),
                          ))
                      .toList(),
                  onChanged: (p) {
                    setState(() {
                      _selectedProduct = p;
                      _amountCtrl.clear();
                      _termCtrl.clear();
                    });
                  },
                  validator: (v) => v == null ? 'Required' : null,
                );
              },
            ),

            if (_selectedProduct != null) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: 16, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '\$${_selectedProduct!.minAmount.toStringAsFixed(0)}–'
                        '\$${_selectedProduct!.maxAmount.toStringAsFixed(0)} • '
                        '${_selectedProduct!.minTerm}–${_selectedProduct!.maxTerm} periods • '
                        '${_selectedProduct!.interestRate}% ${_selectedProduct!.interestType}',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            const _SectionHeader('Loan Details'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _amountCtrl,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                    decoration: const InputDecoration(
                      labelText: 'Amount *',
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      final d = double.tryParse(v);
                      if (d == null || d <= 0) return 'Invalid amount';
                      if (_selectedProduct != null) {
                        if (d < _selectedProduct!.minAmount) {
                          return 'Min \$${_selectedProduct!.minAmount.toStringAsFixed(0)}';
                        }
                        if (d > _selectedProduct!.maxAmount) {
                          return 'Max \$${_selectedProduct!.maxAmount.toStringAsFixed(0)}';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _termCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'No. of Repayments *',
                      hintText: _selectedProduct != null
                          ? '${_selectedProduct!.minTerm}–${_selectedProduct!.maxTerm}'
                          : 'e.g. 12',
                      prefixIcon: const Icon(Icons.repeat),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      final n = int.tryParse(v);
                      if (n == null || n <= 0) return 'Enter a whole number';
                      if (_selectedProduct != null) {
                        if (n < _selectedProduct!.minTerm) {
                          return 'Min ${_selectedProduct!.minTerm} repayments';
                        }
                        if (n > _selectedProduct!.maxTerm) {
                          return 'Max ${_selectedProduct!.maxTerm} repayments';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _purposeCtrl,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Purpose *',
                prefixIcon: Icon(Icons.notes),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Describe the loan purpose'
                  : null,
            ),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: _saving ? null : _submit,
              icon: _saving
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.send),
              label: const Text('Submit Application'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SelectedCard extends StatelessWidget {
  final String label;
  final String sub;
  final VoidCallback onClear;
  const _SelectedCard(
      {required this.label, required this.sub, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(label),
        subtitle: Text(sub),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClear,
          tooltip: 'Change client',
        ),
      ),
    );
  }
}

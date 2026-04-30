import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/loan_provider.dart';

class RepaymentFormScreen extends ConsumerStatefulWidget {
  final String? loanId;
  const RepaymentFormScreen({super.key, this.loanId});

  @override
  ConsumerState<RepaymentFormScreen> createState() => _RepaymentFormScreenState();
}

class _RepaymentFormScreenState extends ConsumerState<RepaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _referenceCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  String? _selectedLoanId;
  String _paymentMethod = 'cash';
  DateTime _paymentDate = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selectedLoanId = widget.loanId;
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _referenceCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedLoanId == null || _selectedLoanId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a loan')),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await ref.read(repaymentActionsProvider).recordRepayment(
            loanId: _selectedLoanId!,
            amount: double.parse(_amountCtrl.text.trim()),
            paymentDate: _paymentDate.toIso8601String().split('T').first,
            paymentMethod: _paymentMethod,
            referenceNumber: _referenceCtrl.text.trim(),
            notes: _notesCtrl.text.trim(),
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Repayment recorded (pending sync)'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loansAsync = ref.watch(loansProvider(null));

    return Scaffold(
      appBar: AppBar(title: const Text('Record Repayment')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (widget.loanId == null) ...[
              loansAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Could not load loans: $e'),
                data: (loans) {
                  final activeLoans = loans
                      .where((l) => l.status == 'active' && l.isDeleted == false)
                      .toList();
                  if (activeLoans.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        'No active loans available for repayment.',
                        style: TextStyle(color: Colors.orange),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: DropdownButtonFormField<String>(
                      value: _selectedLoanId,
                      decoration: const InputDecoration(
                        labelText: 'Loan *',
                        prefixIcon: Icon(Icons.account_balance_wallet),
                        border: OutlineInputBorder(),
                      ),
                      items: activeLoans
                          .map(
                            (loan) => DropdownMenuItem(
                              value: loan.id,
                              child: Text(
                                '${loan.loanNumber} - \$${loan.outstandingBalance.toStringAsFixed(2)}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _selectedLoanId = v),
                      validator: (v) => (v == null || v.isEmpty) ? 'Loan is required' : null,
                    ),
                  );
                },
              ),
            ],
            TextFormField(
              controller: _amountCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Amount *',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                final d = double.tryParse(v);
                if (d == null || d <= 0) return 'Enter a valid amount';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Payment date
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: Text('Payment Date: ${_paymentDate.toIso8601String().split('T').first}'),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(4),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _paymentDate,
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => _paymentDate = picked);
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _paymentMethod,
              decoration: const InputDecoration(
                labelText: 'Payment Method',
                prefixIcon: Icon(Icons.payment),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'cash', child: Text('Cash')),
                DropdownMenuItem(value: 'mobile_money', child: Text('Mobile Money')),
                DropdownMenuItem(value: 'bank_transfer', child: Text('Bank Transfer')),
              ],
              onChanged: (v) => setState(() => _paymentMethod = v ?? 'cash'),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _referenceCtrl,
              decoration: const InputDecoration(
                labelText: 'Reference Number (optional)',
                prefixIcon: Icon(Icons.receipt),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _notesCtrl,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Notes (optional)',
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.check),
              label: const Text('Record Repayment'),
            ),
          ],
        ),
      ),
    );
  }
}

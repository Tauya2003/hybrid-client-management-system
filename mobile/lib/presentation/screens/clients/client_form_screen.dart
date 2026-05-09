import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/client_provider.dart';

class ClientFormScreen extends ConsumerStatefulWidget {
  const ClientFormScreen({super.key});

  @override
  ConsumerState<ClientFormScreen> createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends ConsumerState<ClientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nationalIdCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _kinNameCtrl = TextEditingController();
  final _kinPhoneCtrl = TextEditingController();

  String _gender = 'M';
  DateTime? _dob;
  bool _saving = false;

  static final _nameFormatter = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s\-']"));
  static final _phoneFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-\s]'));

  @override
  void dispose() {
    _nationalIdCtrl.dispose();
    _phoneCtrl.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _addressCtrl.dispose();
    _kinNameCtrl.dispose();
    _kinPhoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1930),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      helpText: 'Select Date of Birth',
    );
    if (picked != null) setState(() => _dob = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date of birth')),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final actions = ref.read(clientActionsProvider);
      final id = await actions.createClient(
        nationalId: _nationalIdCtrl.text.trim(),
        phoneNumber: _phoneCtrl.text.trim(),
        firstName: _firstNameCtrl.text.trim(),
        lastName: _lastNameCtrl.text.trim(),
        dateOfBirth: _dob!.toIso8601String().split('T').first,
        gender: _gender,
        address: _addressCtrl.text.trim(),
        nextOfKinName: _kinNameCtrl.text.trim(),
        nextOfKinPhone: _kinPhoneCtrl.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Client registered (pending sync)'),
            backgroundColor: Colors.green,
          ),
        );
        context.pushReplacement('/clients/$id');
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

  String? _validateName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    if (v.trim().length < 2) return 'Must be at least 2 characters';
    if (RegExp(r'[0-9]').hasMatch(v)) return 'Must not contain numbers';
    return null;
  }

  String? _validatePhone(String? v, {bool required = true}) {
    if (v == null || v.trim().isEmpty) {
      return required ? 'Required' : null;
    }
    final digits = v.replaceAll(RegExp(r'[\s\-+]'), '');
    if (!RegExp(r'^\d{7,15}$').hasMatch(digits)) {
      return 'Enter a valid phone number (7–15 digits)';
    }
    return null;
  }

  String? _validateNationalId(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    if (v.trim().length < 4) return 'Must be at least 4 characters';
    if (v.contains(' ')) return 'Must not contain spaces';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Client')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _SectionHeader('Personal Information'),
            const SizedBox(height: 12),
            _buildField(
              _firstNameCtrl, 'First Name', Icons.person,
              inputFormatters: [_nameFormatter],
              validator: _validateName,
            ),
            const SizedBox(height: 12),
            _buildField(
              _lastNameCtrl, 'Last Name', Icons.person,
              inputFormatters: [_nameFormatter],
              validator: _validateName,
            ),
            const SizedBox(height: 12),
            _buildField(
              _nationalIdCtrl, 'National ID Number', Icons.badge,
              validator: _validateNationalId,
            ),
            const SizedBox(height: 12),
            _buildField(
              _phoneCtrl, 'Phone Number', Icons.phone,
              keyboardType: TextInputType.phone,
              inputFormatters: [_phoneFormatter],
              validator: (v) => _validatePhone(v, required: true),
            ),
            const SizedBox(height: 12),

            // Date of birth
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: Text(_dob == null
                  ? 'Select Date of Birth *'
                  : 'DOB: ${_dob!.toIso8601String().split('T').first}'),
              tileColor: _dob == null ? Colors.transparent : null,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(4),
              ),
              onTap: _pickDob,
            ),
            const SizedBox(height: 12),

            // Gender
            DropdownButtonFormField<String>(
              initialValue: _gender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                prefixIcon: Icon(Icons.wc),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'M', child: Text('Male')),
                DropdownMenuItem(value: 'F', child: Text('Female')),
                DropdownMenuItem(value: 'O', child: Text('Other')),
              ],
              onChanged: (v) => setState(() => _gender = v ?? 'M'),
            ),
            const SizedBox(height: 12),
            _buildField(_addressCtrl, 'Address', Icons.location_on, required: true, maxLines: 2),

            const SizedBox(height: 20),
            const _SectionHeader('Next of Kin (Optional)'),
            const SizedBox(height: 12),
            _buildField(
              _kinNameCtrl, 'Next of Kin Name', Icons.contacts,
              inputFormatters: [_nameFormatter],
              validator: (v) {
                if (v == null || v.trim().isEmpty) return null;
                if (v.trim().length < 2) return 'Must be at least 2 characters';
                if (RegExp(r'[0-9]').hasMatch(v)) return 'Must not contain numbers';
                return null;
              },
            ),
            const SizedBox(height: 12),
            _buildField(
              _kinPhoneCtrl, 'Next of Kin Phone', Icons.phone,
              keyboardType: TextInputType.phone,
              inputFormatters: [_phoneFormatter],
              validator: (v) => _validatePhone(v, required: false),
            ),

            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.save),
              label: const Text('Register Client'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController ctrl,
    String label,
    IconData icon, {
    bool required = false,
    TextInputType? keyboardType,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: validator != null || required ? '$label *' : label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      validator: validator ?? (required ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null : null),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

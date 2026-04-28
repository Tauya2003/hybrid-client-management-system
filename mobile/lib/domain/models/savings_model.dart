class SavingsAccountModel {
  final String id;
  final String clientId;
  final String accountNumber;
  final String accountType;
  final double balance;
  final double minimumBalance;
  final bool isActive;
  final String syncStatus;
  final String updatedAt;
  final int version;

  const SavingsAccountModel({
    required this.id,
    required this.clientId,
    required this.accountNumber,
    required this.accountType,
    required this.balance,
    required this.minimumBalance,
    required this.isActive,
    required this.syncStatus,
    required this.updatedAt,
    required this.version,
  });

  double get availableBalance => balance - minimumBalance;

  factory SavingsAccountModel.fromJson(Map<String, dynamic> json) {
    return SavingsAccountModel(
      id: json['id'] as String,
      clientId: (json['client'] ?? json['client_id']) as String,
      accountNumber: json['account_number'] as String,
      accountType: json['account_type'] as String,
      balance: (json['balance'] as num).toDouble(),
      minimumBalance: (json['minimum_balance'] as num?)?.toDouble() ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      syncStatus: json['sync_status'] as String? ?? 'synced',
      updatedAt: json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
      version: json['version'] as int? ?? 1,
    );
  }
}

class SavingsTransactionModel {
  final String id;
  final String savingsAccountId;
  final String transactionType;
  final double amount;
  final double balanceAfter;
  final String transactionDate;
  final String performedById;
  final String referenceNumber;
  final String notes;
  final String syncStatus;
  final String updatedAt;
  final int version;
  final bool isDeleted;

  const SavingsTransactionModel({
    required this.id,
    required this.savingsAccountId,
    required this.transactionType,
    required this.amount,
    required this.balanceAfter,
    required this.transactionDate,
    required this.performedById,
    required this.referenceNumber,
    required this.notes,
    required this.syncStatus,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
  });

  bool get isDeposit => transactionType == 'deposit';
  bool get isPendingSync => syncStatus == 'pending';

  Map<String, dynamic> toSyncPayload() => {
        'id': id,
        'savings_account_id': savingsAccountId,
        'transaction_type': transactionType,
        'amount': amount,
        'balance_after': balanceAfter,
        'transaction_date': transactionDate,
        'performed_by_id': performedById,
        'reference_number': referenceNumber,
        'notes': notes,
        'updated_at': updatedAt,
        'version': version,
        'is_deleted': isDeleted,
      };
}

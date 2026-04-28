class LoanProductModel {
  final String id;
  final String name;
  final String description;
  final double minAmount;
  final double maxAmount;
  final double interestRate;
  final String interestType;
  final String repaymentFrequency;
  final int minTerm;
  final int maxTerm;
  final double processingFeeRate;
  final bool isActive;

  const LoanProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.minAmount,
    required this.maxAmount,
    required this.interestRate,
    required this.interestType,
    required this.repaymentFrequency,
    required this.minTerm,
    required this.maxTerm,
    required this.processingFeeRate,
    required this.isActive,
  });

  factory LoanProductModel.fromJson(Map<String, dynamic> json) {
    return LoanProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      minAmount: (json['min_amount'] as num).toDouble(),
      maxAmount: (json['max_amount'] as num).toDouble(),
      interestRate: (json['interest_rate'] as num).toDouble(),
      interestType: json['interest_type'] as String,
      repaymentFrequency: json['repayment_frequency'] as String,
      minTerm: json['min_term'] as int,
      maxTerm: json['max_term'] as int,
      processingFeeRate: (json['processing_fee_rate'] as num).toDouble(),
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}

class LoanApplicationModel {
  final String id;
  final String clientId;
  final String? groupId;
  final String loanProductId;
  final String loanProductName;
  final double amountRequested;
  final int term;
  final String purpose;
  final String status;
  final String appliedById;
  final String appliedAt;
  final String notes;
  final String syncStatus;
  final String updatedAt;
  final int version;
  final bool isDeleted;

  const LoanApplicationModel({
    required this.id,
    required this.clientId,
    this.groupId,
    required this.loanProductId,
    required this.loanProductName,
    required this.amountRequested,
    required this.term,
    required this.purpose,
    required this.status,
    required this.appliedById,
    required this.appliedAt,
    required this.notes,
    required this.syncStatus,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
  });

  bool get isDraft => status == 'draft';
  bool get isPendingSync => syncStatus == 'pending';

  factory LoanApplicationModel.fromJson(Map<String, dynamic> json) {
    return LoanApplicationModel(
      id: json['id'] as String,
      clientId: (json['client'] ?? json['client_id']) as String,
      groupId: (json['group'] ?? json['group_id']) as String?,
      loanProductId: (json['loan_product'] ?? json['loan_product_id']) as String,
      loanProductName: json['product_name'] as String? ?? json['loan_product_name'] as String? ?? '',
      amountRequested: (json['amount_requested'] as num).toDouble(),
      term: json['term'] as int,
      purpose: json['purpose'] as String,
      status: json['status'] as String,
      appliedById: (json['applied_by'] ?? json['applied_by_id']) as String,
      appliedAt: json['applied_at'] as String,
      notes: json['notes'] as String? ?? '',
      syncStatus: json['sync_status'] as String? ?? 'synced',
      updatedAt: json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
      version: json['version'] as int? ?? 1,
      isDeleted: json['is_deleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toSyncPayload() => {
        'id': id,
        'client_id': clientId,
        'group_id': groupId,
        'loan_product_id': loanProductId,
        'amount_requested': amountRequested,
        'term': term,
        'purpose': purpose,
        'status': status,
        'applied_by_id': appliedById,
        'applied_at': appliedAt,
        'notes': notes,
        'updated_at': updatedAt,
        'version': version,
        'is_deleted': isDeleted,
      };
}

class LoanModel {
  final String id;
  final String clientId;
  final String loanProductId;
  final String loanNumber;
  final double principalAmount;
  final double interestAmount;
  final double totalAmount;
  final double amountPaid;
  final double outstandingBalance;
  final String disbursementDate;
  final String maturityDate;
  final String status;
  final String updatedAt;

  const LoanModel({
    required this.id,
    required this.clientId,
    required this.loanProductId,
    required this.loanNumber,
    required this.principalAmount,
    required this.interestAmount,
    required this.totalAmount,
    required this.amountPaid,
    required this.outstandingBalance,
    required this.disbursementDate,
    required this.maturityDate,
    required this.status,
    required this.updatedAt,
  });

  double get repaymentProgress => totalAmount > 0 ? amountPaid / totalAmount : 0;
  bool get isActive => status == 'active';

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      id: json['id'] as String,
      clientId: (json['client'] ?? json['client_id']) as String,
      loanProductId: (json['loan_product'] ?? json['loan_product_id']) as String,
      loanNumber: json['loan_number'] as String,
      principalAmount: (json['principal_amount'] as num).toDouble(),
      interestAmount: (json['interest_amount'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      amountPaid: (json['amount_paid'] as num?)?.toDouble() ?? 0,
      outstandingBalance: (json['outstanding_balance'] as num).toDouble(),
      disbursementDate: json['disbursement_date'] as String,
      maturityDate: json['maturity_date'] as String,
      status: json['status'] as String,
      updatedAt: json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
    );
  }
}

class RepaymentModel {
  final String id;
  final String loanId;
  final double amount;
  final String paymentDate;
  final String paymentMethod;
  final String referenceNumber;
  final String receivedById;
  final String notes;
  final String syncStatus;
  final String updatedAt;
  final int version;
  final bool isDeleted;

  const RepaymentModel({
    required this.id,
    required this.loanId,
    required this.amount,
    required this.paymentDate,
    required this.paymentMethod,
    required this.referenceNumber,
    required this.receivedById,
    required this.notes,
    required this.syncStatus,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
  });

  bool get isPendingSync => syncStatus == 'pending';

  Map<String, dynamic> toSyncPayload() => {
        'id': id,
        'loan_id': loanId,
        'amount': amount,
        'payment_date': paymentDate,
        'payment_method': paymentMethod,
        'reference_number': referenceNumber,
        'received_by_id': receivedById,
        'notes': notes,
        'updated_at': updatedAt,
        'version': version,
        'is_deleted': isDeleted,
      };
}

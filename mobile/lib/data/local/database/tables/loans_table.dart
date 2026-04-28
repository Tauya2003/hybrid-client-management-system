import 'package:drift/drift.dart';

class LoanProductsTable extends Table {
  @override
  String get tableName => 'loan_products';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  RealColumn get minAmount => real().named('min_amount')();
  RealColumn get maxAmount => real().named('max_amount')();
  RealColumn get interestRate => real().named('interest_rate')();
  TextColumn get interestType => text().named('interest_type')();
  TextColumn get repaymentFrequency => text().named('repayment_frequency')();
  IntColumn get minTerm => integer().named('min_term')();
  IntColumn get maxTerm => integer().named('max_term')();
  RealColumn get processingFeeRate => real().named('processing_fee_rate').withDefault(const Constant(0.0))();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();
  TextColumn get syncedAt => text().named('synced_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LoanApplicationsTable extends Table {
  @override
  String get tableName => 'loan_applications';

  TextColumn get id => text()();
  TextColumn get clientId => text().named('client_id')();
  TextColumn get groupId => text().named('group_id').nullable()();
  TextColumn get loanProductId => text().named('loan_product_id')();
  TextColumn get loanProductName => text().named('loan_product_name').withDefault(const Constant(''))();
  RealColumn get amountRequested => real().named('amount_requested')();
  IntColumn get term => integer()();
  TextColumn get purpose => text()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  TextColumn get appliedById => text().named('applied_by_id')();
  TextColumn get appliedAt => text().named('applied_at')();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get rejectionReason => text().named('rejection_reason').withDefault(const Constant(''))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class LoansTable extends Table {
  @override
  String get tableName => 'loans';

  TextColumn get id => text()();
  TextColumn get applicationId => text().named('application_id')();
  TextColumn get clientId => text().named('client_id')();
  TextColumn get loanProductId => text().named('loan_product_id')();
  TextColumn get loanNumber => text().named('loan_number')();
  RealColumn get principalAmount => real().named('principal_amount')();
  RealColumn get interestAmount => real().named('interest_amount')();
  RealColumn get totalAmount => real().named('total_amount')();
  RealColumn get amountPaid => real().named('amount_paid').withDefault(const Constant(0.0))();
  RealColumn get outstandingBalance => real().named('outstanding_balance')();
  TextColumn get disbursementDate => text().named('disbursement_date')();
  TextColumn get maturityDate => text().named('maturity_date')();
  TextColumn get status => text().withDefault(const Constant('active'))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('synced'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class RepaymentScheduleTable extends Table {
  @override
  String get tableName => 'repayment_schedule';

  TextColumn get id => text()();
  TextColumn get loanId => text().named('loan_id')();
  IntColumn get installmentNumber => integer().named('installment_number')();
  TextColumn get dueDate => text().named('due_date')();
  RealColumn get principalDue => real().named('principal_due')();
  RealColumn get interestDue => real().named('interest_due')();
  RealColumn get totalDue => real().named('total_due')();
  RealColumn get principalPaid => real().named('principal_paid').withDefault(const Constant(0.0))();
  RealColumn get interestPaid => real().named('interest_paid').withDefault(const Constant(0.0))();
  RealColumn get totalPaid => real().named('total_paid').withDefault(const Constant(0.0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}

class RepaymentsTable extends Table {
  @override
  String get tableName => 'repayments';

  TextColumn get id => text()();
  TextColumn get loanId => text().named('loan_id')();
  RealColumn get amount => real()();
  TextColumn get paymentDate => text().named('payment_date')();
  TextColumn get paymentMethod => text().named('payment_method').withDefault(const Constant('cash'))();
  TextColumn get referenceNumber => text().named('reference_number').withDefault(const Constant(''))();
  TextColumn get receivedById => text().named('received_by_id')();
  TextColumn get notes => text().withDefault(const Constant(''))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

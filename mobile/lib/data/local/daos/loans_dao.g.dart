// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loans_dao.dart';

// ignore_for_file: type=lint
mixin _$LoansDaoMixin on DatabaseAccessor<AppDatabase> {
  $LoanProductsTableTable get loanProductsTable =>
      attachedDatabase.loanProductsTable;
  $LoanApplicationsTableTable get loanApplicationsTable =>
      attachedDatabase.loanApplicationsTable;
  $LoansTableTable get loansTable => attachedDatabase.loansTable;
  $RepaymentScheduleTableTable get repaymentScheduleTable =>
      attachedDatabase.repaymentScheduleTable;
  $RepaymentsTableTable get repaymentsTable => attachedDatabase.repaymentsTable;
  LoansDaoManager get managers => LoansDaoManager(this);
}

class LoansDaoManager {
  final _$LoansDaoMixin _db;
  LoansDaoManager(this._db);
  $$LoanProductsTableTableTableManager get loanProductsTable =>
      $$LoanProductsTableTableTableManager(
          _db.attachedDatabase, _db.loanProductsTable);
  $$LoanApplicationsTableTableTableManager get loanApplicationsTable =>
      $$LoanApplicationsTableTableTableManager(
          _db.attachedDatabase, _db.loanApplicationsTable);
  $$LoansTableTableTableManager get loansTable =>
      $$LoansTableTableTableManager(_db.attachedDatabase, _db.loansTable);
  $$RepaymentScheduleTableTableTableManager get repaymentScheduleTable =>
      $$RepaymentScheduleTableTableTableManager(
          _db.attachedDatabase, _db.repaymentScheduleTable);
  $$RepaymentsTableTableTableManager get repaymentsTable =>
      $$RepaymentsTableTableTableManager(
          _db.attachedDatabase, _db.repaymentsTable);
}

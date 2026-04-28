import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/loans_table.dart';

part 'loans_dao.g.dart';

@DriftAccessor(tables: [
  LoanProductsTable,
  LoanApplicationsTable,
  LoansTable,
  RepaymentScheduleTable,
  RepaymentsTable,
])
class LoansDao extends DatabaseAccessor<AppDatabase> with _$LoansDaoMixin {
  LoansDao(super.db);

  // Loan products
  Future<List<LoanProductsTableData>> getActiveLoanProducts() {
    return (select(loanProductsTable)
          ..where((t) => t.isActive.equals(true)))
        .get();
  }

  Stream<List<LoanProductsTableData>> watchActiveLoanProducts() {
    return (select(loanProductsTable)
          ..where((t) => t.isActive.equals(true)))
        .watch();
  }

  Future<void> upsertLoanProduct(LoanProductsTableCompanion p) {
    return into(loanProductsTable).insertOnConflictUpdate(p);
  }

  // Loan applications
  Stream<List<LoanApplicationsTableData>> watchApplications({String? clientId}) {
    final query = select(loanApplicationsTable)
      ..where((t) => t.isDeleted.equals(false));
    if (clientId != null) {
      query.where((t) => t.clientId.equals(clientId));
    }
    query.orderBy([(t) => OrderingTerm(expression: t.appliedAt, mode: OrderingMode.desc)]);
    return query.watch();
  }

  Future<void> upsertApplication(LoanApplicationsTableCompanion app) {
    return into(loanApplicationsTable).insertOnConflictUpdate(app);
  }

  Future<List<LoanApplicationsTableData>> getPendingApplications() {
    return (select(loanApplicationsTable)
          ..where((t) => t.syncStatus.equals('pending') & t.isDeleted.equals(false)))
        .get();
  }

  // Loans
  Stream<List<LoansTableData>> watchLoans({String? clientId, String? status}) {
    final query = select(loansTable)
      ..where((t) => t.isDeleted.equals(false));
    if (clientId != null) query.where((t) => t.clientId.equals(clientId));
    if (status != null) query.where((t) => t.status.equals(status));
    query.orderBy([(t) => OrderingTerm(expression: t.disbursementDate, mode: OrderingMode.desc)]);
    return query.watch();
  }

  Future<LoansTableData?> getLoanById(String id) {
    return (select(loansTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> upsertLoan(LoansTableCompanion loan) {
    return into(loansTable).insertOnConflictUpdate(loan);
  }

  // Repayment schedule
  Future<List<RepaymentScheduleTableData>> getScheduleForLoan(String loanId) {
    return (select(repaymentScheduleTable)
          ..where((t) => t.loanId.equals(loanId))
          ..orderBy([(t) => OrderingTerm(expression: t.installmentNumber)]))
        .get();
  }

  Future<void> upsertScheduleItem(RepaymentScheduleTableCompanion item) {
    return into(repaymentScheduleTable).insertOnConflictUpdate(item);
  }

  // Repayments
  Stream<List<RepaymentsTableData>> watchRepayments({required String loanId}) {
    return (select(repaymentsTable)
          ..where((t) => t.loanId.equals(loanId) & t.isDeleted.equals(false))
          ..orderBy([(t) => OrderingTerm(expression: t.paymentDate, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsertRepayment(RepaymentsTableCompanion repayment) {
    return into(repaymentsTable).insertOnConflictUpdate(repayment);
  }

  Future<List<RepaymentsTableData>> getPendingRepayments() {
    return (select(repaymentsTable)
          ..where((t) => t.syncStatus.equals('pending') & t.isDeleted.equals(false)))
        .get();
  }
}

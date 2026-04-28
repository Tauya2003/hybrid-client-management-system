export interface AuthUser {
  user_id: string;
  username: string;
  email: string;
  full_name: string;
  role: 'admin' | 'branch_manager' | 'field_officer' | 'auditor';
  branch_id: string | null;
  branch_name: string | null;
}

export interface Branch {
  id: string;
  name: string;
  code: string;
  address: string;
  phone?: string;
  email?: string;
  is_active: boolean;
}

export interface Client {
  id: string;
  national_id: string;
  first_name: string;
  last_name: string;
  full_name: string;
  phone_number: string;
  date_of_birth: string;
  gender: 'M' | 'F' | 'O';
  address: string;
  next_of_kin_name: string;
  next_of_kin_phone: string;
  branch_name: string;
  is_active: boolean;
  created_at: string;
}

export interface Group {
  id: string;
  name: string;
  group_type: 'solidarity' | 'individual';
  branch: Branch;
  field_officer: { id: string; full_name: string };
  meeting_day: string;
  meeting_frequency: string;
  member_count: number;
  is_active: boolean;
  created_at: string;
}

export interface LoanProduct {
  id: string;
  name: string;
  interest_rate: number;
  interest_type: 'flat' | 'reducing';
  min_amount: number;
  max_amount: number;
  min_term: number;
  max_term: number;
  repayment_frequency: 'weekly' | 'biweekly' | 'monthly';
  is_active: boolean;
}

export interface LoanApplication {
  id: string;
  client: string;
  client_name: string;
  loan_product: string;
  product_name: string;
  amount_requested: number;
  term: number;
  purpose: string;
  status: 'draft' | 'submitted' | 'under_review' | 'approved' | 'rejected' | 'disbursed';
  applied_at: string;
  reviewed_at: string | null;
  rejection_reason: string;
  notes: string;
}

export interface Loan {
  id: string;
  loan_number: string;
  client: string;
  client_name: string;
  product_name: string;
  principal_amount: number;
  outstanding_balance: number;
  status: 'active' | 'completed' | 'defaulted' | 'written_off';
  disbursement_date: string;
  maturity_date: string | null;
}

export interface LoanDetail extends Loan {
  loan_product: string;
  interest_rate: number;
  interest_type: string;
  repayment_frequency: string;
  term: number;
  interest_amount: number;
  processing_fee: number;
  total_amount: number;
  amount_paid: number;
  disbursed_by_name: string;
  schedule: RepaymentSchedule[];
}

export interface RepaymentSchedule {
  id: string;
  installment_number: number;
  due_date: string;
  principal_due: number;
  interest_due: number;
  total_due: number;
  principal_paid: number;
  interest_paid: number;
  status: 'pending' | 'partial' | 'paid' | 'overdue';
}

export interface Repayment {
  id: string;
  loan: string;
  amount: number;
  payment_date: string;
  payment_method: string;
  reference_number: string;
  received_by: { id: string; full_name: string };
  notes: string;
  created_at: string;
}

export interface SavingsAccount {
  id: string;
  account_number: string;
  client: { id: string; full_name: string };
  account_type: string;
  balance: number;
  minimum_balance: number;
  interest_rate: number;
  is_active: boolean;
  opened_at: string;
}

export interface SavingsTransaction {
  id: string;
  savings_account: string;
  transaction_type: 'deposit' | 'withdrawal' | 'interest';
  amount: number;
  balance_after: number;
  transaction_date: string;
  performed_by: { id: string; full_name: string };
  reference_number: string;
}

export interface PortfolioSummary {
  total_clients: number;
  active_clients: number;
  total_groups: number;
  loan_applications: {
    total: number;
    draft: number;
    submitted: number;
    approved: number;
    disbursed: number;
    rejected: number;
  };
  active_loans: {
    count: number;
    total_outstanding: number;
    total_disbursed: number;
    total_repaid: number;
  };
  par: {
    par_1: number;
    par_30: number;
    par_60: number;
    par_90: number;
    par_1_rate: number;
    par_30_rate: number;
    par_60_rate: number;
    par_90_rate: number;
  };
  savings: {
    total_accounts: number;
    total_balance: number;
  };
}

export interface PaginatedResponse<T> {
  count: number;
  next: string | null;
  previous: string | null;
  results: T[];
}

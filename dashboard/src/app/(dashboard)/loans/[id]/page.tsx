'use client';

import useSWR from 'swr';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft, CheckCircle, Clock, AlertCircle } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { LoanDetail, Repayment } from '@/lib/types';
import { Badge, statusBadge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import clsx from 'clsx';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex gap-4 py-2 border-b border-slate-50 last:border-0">
      <span className="w-36 text-xs text-slate-500 font-medium flex-shrink-0">{label}</span>
      <span className="text-sm text-slate-900">{value || '—'}</span>
    </div>
  );
}

function scheduleIcon(status: string) {
  if (status === 'paid') return <CheckCircle className="w-4 h-4 text-green-500" />;
  if (status === 'overdue') return <AlertCircle className="w-4 h-4 text-red-500" />;
  return <Clock className="w-4 h-4 text-slate-300" />;
}

export default function LoanDetailPage() {
  const { id } = useParams<{ id: string }>();

  const { data: loan, isLoading } = useSWR<LoanDetail>(`/loans/${id}/`, fetcher);
  const { data: repaymentsData } = useSWR<{ results: Repayment[] }>(`/repayments/?loan=${id}`, fetcher);

  if (isLoading) return <PageLoader />;
  if (!loan) return <div className="p-6 text-slate-500">Loan not found.</div>;

  const repayments = repaymentsData?.results ?? [];
  const schedule = loan.schedule ?? [];

  const repaidPct = loan.total_amount > 0
    ? Math.min(100, (loan.amount_paid / loan.total_amount) * 100)
    : 0;

  return (
    <div className="p-6 space-y-5 max-w-4xl">
      <div className="flex items-center gap-3">
        <Link href="/loans" className="text-slate-400 hover:text-slate-600">
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <div>
          <h1 className="text-xl font-bold font-mono">{loan.loan_number}</h1>
          <Link href={`/clients/${loan.client}`} className="text-sm text-blue-600 hover:underline">
            {loan.client_name}
          </Link>
        </div>
        <div className="ml-auto">
          <Badge variant={statusBadge(loan.status)}>{loan.status}</Badge>
        </div>
      </div>

      {/* Progress bar */}
      <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
        <div className="flex items-center justify-between mb-2">
          <span className="text-xs text-slate-500">Repayment Progress</span>
          <span className="text-xs font-semibold text-slate-700">{repaidPct.toFixed(1)}%</span>
        </div>
        <div className="h-2.5 bg-slate-100 rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-blue-500 to-emerald-500 rounded-full transition-all"
            style={{ width: `${repaidPct}%` }}
          />
        </div>
        <div className="flex justify-between mt-2">
          <span className="text-xs text-slate-500">
            Repaid: <strong className="text-slate-700">{fmt.currency(loan.amount_paid)}</strong>
          </span>
          <span className="text-xs text-slate-500">
            Outstanding: <strong className="text-red-600">{fmt.currency(loan.outstanding_balance)}</strong>
          </span>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        {/* Loan details */}
        <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-3">Loan Details</h2>
          <InfoRow label="Loan Product" value={loan.product_name} />
          <InfoRow label="Principal" value={fmt.currency(loan.principal_amount)} />
          <InfoRow label="Interest" value={fmt.currency(loan.interest_amount)} />
          <InfoRow label="Total Amount" value={fmt.currency(loan.total_amount)} />
          <InfoRow label="Interest Rate" value={`${loan.interest_rate}% (${loan.interest_type})`} />
          <InfoRow label="Term" value={`${loan.term} periods`} />
          <InfoRow label="Frequency" value={loan.repayment_frequency} />
          <InfoRow label="Disbursed" value={loan.disbursement_date ? fmt.date(loan.disbursement_date) : '—'} />
          <InfoRow label="Matures" value={loan.maturity_date ? fmt.date(loan.maturity_date) : '—'} />
        </div>

        {/* Recent repayments */}
        <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-3">
            Repayments ({repayments.length})
          </h2>
          {repayments.length === 0 ? (
            <p className="text-sm text-slate-400 py-4 text-center">No repayments recorded</p>
          ) : (
            <div className="space-y-2">
              {repayments.slice(0, 6).map((r) => (
                <div key={r.id} className="flex items-center justify-between py-1.5 border-b border-slate-50">
                  <div>
                    <p className="text-sm font-medium text-emerald-700">{fmt.currency(r.amount)}</p>
                    <p className="text-xs text-slate-400">
                      {fmt.date(r.payment_date)} · {r.payment_method.replace('_', ' ')}
                    </p>
                  </div>
                  {r.reference_number && (
                    <p className="text-xs text-slate-400 font-mono">{r.reference_number}</p>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Repayment schedule */}
      <div className="bg-white rounded-xl border border-slate-100 shadow-sm">
        <div className="px-5 py-4 border-b border-slate-50">
          <h2 className="text-sm font-semibold text-slate-700">
            Repayment Schedule ({schedule.length} installments)
          </h2>
        </div>
        {schedule.length === 0 ? (
          <p className="text-center py-8 text-slate-400 text-sm">No schedule generated</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr>
                  <th className="table-header">#</th>
                  <th className="table-header">Due Date</th>
                  <th className="table-header">Principal</th>
                  <th className="table-header">Interest</th>
                  <th className="table-header">Total Due</th>
                  <th className="table-header">Paid</th>
                  <th className="table-header">Status</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-50">
                {schedule.map((s) => (
                  <tr key={s.id} className={clsx('hover:bg-slate-50', s.status === 'overdue' && 'bg-red-50/50')}>
                    <td className="table-cell">
                      <div className="flex items-center gap-1.5">
                        {scheduleIcon(s.status)}
                        {s.installment_number}
                      </div>
                    </td>
                    <td className="table-cell text-slate-600">{fmt.date(s.due_date)}</td>
                    <td className="table-cell">{fmt.currency(s.principal_due)}</td>
                    <td className="table-cell">{fmt.currency(s.interest_due)}</td>
                    <td className="table-cell font-medium">{fmt.currency(s.total_due)}</td>
                    <td className="table-cell text-emerald-700">
                      {fmt.currency(s.principal_paid + s.interest_paid)}
                    </td>
                    <td className="table-cell">
                      <Badge variant={statusBadge(s.status)}>{s.status}</Badge>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}

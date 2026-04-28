'use client';

import { useState } from 'react';
import useSWR from 'swr';
import Link from 'next/link';
import { Search, Check, X, Banknote, Send } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PaginatedResponse, Loan, LoanApplication } from '@/lib/types';
import { Badge, statusBadge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import clsx from 'clsx';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

type Tab = 'active' | 'applications';

type ActionState =
  | { type: 'idle' }
  | { type: 'reject'; id: string; reason: string }
  | { type: 'loading'; id: string; action: string };

export default function LoansPage() {
  const [tab, setTab] = useState<Tab>('active');
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);
  const [actionState, setActionState] = useState<ActionState>({ type: 'idle' });
  const [actionError, setActionError] = useState<string | null>(null);

  const query = new URLSearchParams({ page: String(page), page_size: '20' });
  if (search) query.set('search', search);

  const { data: loansData, isLoading: loansLoading } = useSWR<PaginatedResponse<Loan>>(
    tab === 'active' ? `/loans/?${query}` : null,
    fetcher,
    { keepPreviousData: true },
  );
  const { data: appsData, isLoading: appsLoading, mutate: mutateApps } = useSWR<PaginatedResponse<LoanApplication>>(
    tab === 'applications' ? `/loan-applications/?${query}` : null,
    fetcher,
    { keepPreviousData: true },
  );

  function switchTab(t: Tab) {
    setTab(t);
    setPage(1);
    setSearch('');
    setActionState({ type: 'idle' });
    setActionError(null);
  }

  async function doAction(appId: string, action: 'submit' | 'approve' | 'disburse', body?: object) {
    setActionState({ type: 'loading', id: appId, action });
    setActionError(null);
    try {
      await api.post(`/loan-applications/${appId}/${action}/`, body ?? {});
      await mutateApps();
    } catch (err: unknown) {
      const msg = (err as { response?: { data?: { detail?: string } } })?.response?.data?.detail ?? 'Action failed';
      setActionError(msg);
    } finally {
      setActionState({ type: 'idle' });
    }
  }

  async function doReject(appId: string, reason: string) {
    setActionState({ type: 'loading', id: appId, action: 'reject' });
    setActionError(null);
    try {
      await api.post(`/loan-applications/${appId}/reject/`, { rejection_reason: reason });
      await mutateApps();
    } catch (err: unknown) {
      const msg = (err as { response?: { data?: { detail?: string } } })?.response?.data?.detail ?? 'Rejection failed';
      setActionError(msg);
    } finally {
      setActionState({ type: 'idle' });
    }
  }

  const isLoading = tab === 'active' ? loansLoading : appsLoading;
  const count = tab === 'active' ? loansData?.count : appsData?.count;
  const totalPages = Math.ceil((count ?? 0) / 20) || 1;

  if (isLoading && !loansData && !appsData) return <PageLoader />;

  return (
    <div className="p-6 space-y-5">
      <div>
        <h1 className="text-xl font-bold text-slate-900">Loans</h1>
        <p className="text-sm text-slate-500">{count ?? 0} records</p>
      </div>

      <div className="flex gap-1 bg-slate-100 p-1 rounded-lg w-fit">
        {(['active', 'applications'] as Tab[]).map((t) => (
          <button
            key={t}
            onClick={() => switchTab(t)}
            className={clsx(
              'px-4 py-1.5 rounded-md text-sm font-medium transition-colors capitalize',
              tab === t ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-700',
            )}
          >
            {t === 'active' ? 'Active Loans' : 'Applications'}
          </button>
        ))}
      </div>

      <div className="relative max-w-sm">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
        <input
          className="input pl-9"
          placeholder={tab === 'active' ? 'Search loans...' : 'Search applications...'}
          value={search}
          onChange={(e) => { setSearch(e.target.value); setPage(1); }}
        />
      </div>

      {actionError && (
        <div className="px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700">
          {actionError}
        </div>
      )}

      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        {isLoading && <div className="px-5 py-2 bg-blue-50 text-xs text-blue-600 font-medium">Updating...</div>}

        {tab === 'active' ? (
          <table className="w-full">
            <thead>
              <tr>
                <th className="table-header">Loan #</th>
                <th className="table-header">Client</th>
                <th className="table-header">Product</th>
                <th className="table-header">Principal</th>
                <th className="table-header">Outstanding</th>
                <th className="table-header">Disbursed</th>
                <th className="table-header">Matures</th>
                <th className="table-header">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {(loansData?.results ?? []).length === 0 && (
                <tr><td colSpan={8} className="text-center py-12 text-slate-400 text-sm">No loans found</td></tr>
              )}
              {(loansData?.results ?? []).map((loan) => (
                <tr key={loan.id} className="hover:bg-slate-50">
                  <td className="table-cell">
                    <Link href={`/loans/${loan.id}`} className="text-blue-600 hover:underline font-mono text-xs">
                      {loan.loan_number}
                    </Link>
                  </td>
                  <td className="table-cell">
                    <Link href={`/clients/${loan.client}`} className="font-medium hover:text-blue-600">
                      {loan.client_name}
                    </Link>
                  </td>
                  <td className="table-cell text-slate-600">{loan.product_name}</td>
                  <td className="table-cell font-medium">{fmt.currency(loan.principal_amount)}</td>
                  <td className="table-cell font-medium">{fmt.currency(loan.outstanding_balance)}</td>
                  <td className="table-cell text-slate-500">{fmt.date(loan.disbursement_date)}</td>
                  <td className="table-cell text-slate-500">
                    {loan.maturity_date ? fmt.date(loan.maturity_date) : '—'}
                  </td>
                  <td className="table-cell">
                    <Badge variant={statusBadge(loan.status)}>{loan.status}</Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <table className="w-full">
            <thead>
              <tr>
                <th className="table-header">Client</th>
                <th className="table-header">Product</th>
                <th className="table-header">Amount</th>
                <th className="table-header">Term</th>
                <th className="table-header">Purpose</th>
                <th className="table-header">Applied</th>
                <th className="table-header">Status</th>
                <th className="table-header">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {(appsData?.results ?? []).length === 0 && (
                <tr><td colSpan={8} className="text-center py-12 text-slate-400 text-sm">No applications found</td></tr>
              )}
              {(appsData?.results ?? []).map((app) => {
                const isActing = actionState.type === 'loading' && actionState.id === app.id;
                const isRejectOpen = actionState.type === 'reject' && actionState.id === app.id;

                return (
                  <tr key={app.id} className="hover:bg-slate-50">
                    <td className="table-cell">
                      <Link href={`/clients/${app.client}`} className="font-medium hover:text-blue-600">
                        {app.client_name}
                      </Link>
                    </td>
                    <td className="table-cell text-slate-600">{app.product_name}</td>
                    <td className="table-cell font-medium">{fmt.currency(app.amount_requested)}</td>
                    <td className="table-cell text-slate-600">{app.term} mo</td>
                    <td className="table-cell text-slate-500 max-w-xs truncate">{app.purpose || '—'}</td>
                    <td className="table-cell text-slate-500">{fmt.date(app.applied_at)}</td>
                    <td className="table-cell">
                      <Badge variant={statusBadge(app.status)}>{app.status}</Badge>
                    </td>
                    <td className="table-cell">
                      {isRejectOpen ? (
                        <div className="flex flex-col gap-1.5 min-w-[180px]">
                          <input
                            autoFocus
                            className="input text-xs py-1"
                            placeholder="Rejection reason..."
                            value={(actionState as { type: 'reject'; id: string; reason: string }).reason}
                            onChange={(e) =>
                              setActionState({ type: 'reject', id: app.id, reason: e.target.value })
                            }
                          />
                          <div className="flex gap-1">
                            <button
                              className="btn-secondary px-2 py-1 text-xs flex-1"
                              onClick={() => setActionState({ type: 'idle' })}
                            >
                              Cancel
                            </button>
                            <button
                              className="px-2 py-1 text-xs flex-1 bg-red-600 text-white rounded-md hover:bg-red-700 disabled:opacity-50"
                              disabled={!(actionState as { type: 'reject'; id: string; reason: string }).reason.trim()}
                              onClick={() =>
                                doReject(
                                  app.id,
                                  (actionState as { type: 'reject'; id: string; reason: string }).reason,
                                )
                              }
                            >
                              Confirm
                            </button>
                          </div>
                        </div>
                      ) : (
                        <div className="flex gap-1 flex-wrap">
                          {app.status === 'draft' && (
                            <button
                              disabled={isActing}
                              onClick={() => doAction(app.id, 'submit')}
                              className="inline-flex items-center gap-1 px-2 py-1 text-xs rounded-md bg-blue-50 text-blue-700 hover:bg-blue-100 disabled:opacity-50"
                            >
                              <Send className="w-3 h-3" />
                              Submit
                            </button>
                          )}
                          {(app.status === 'submitted' || app.status === 'under_review') && (
                            <>
                              <button
                                disabled={isActing}
                                onClick={() => doAction(app.id, 'approve')}
                                className="inline-flex items-center gap-1 px-2 py-1 text-xs rounded-md bg-green-50 text-green-700 hover:bg-green-100 disabled:opacity-50"
                              >
                                <Check className="w-3 h-3" />
                                Approve
                              </button>
                              <button
                                disabled={isActing}
                                onClick={() => setActionState({ type: 'reject', id: app.id, reason: '' })}
                                className="inline-flex items-center gap-1 px-2 py-1 text-xs rounded-md bg-red-50 text-red-700 hover:bg-red-100 disabled:opacity-50"
                              >
                                <X className="w-3 h-3" />
                                Reject
                              </button>
                            </>
                          )}
                          {app.status === 'approved' && (
                            <button
                              disabled={isActing}
                              onClick={() => doAction(app.id, 'disburse')}
                              className="inline-flex items-center gap-1 px-2 py-1 text-xs rounded-md bg-emerald-50 text-emerald-700 hover:bg-emerald-100 disabled:opacity-50"
                            >
                              <Banknote className="w-3 h-3" />
                              Disburse
                            </button>
                          )}
                          {isActing && (
                            <span className="text-xs text-slate-400 italic">Working...</span>
                          )}
                        </div>
                      )}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        )}

        {totalPages > 1 && (
          <div className="flex items-center justify-between px-5 py-3 border-t border-slate-100">
            <p className="text-xs text-slate-500">Page {page} of {totalPages}</p>
            <div className="flex gap-2">
              <button onClick={() => setPage((p) => Math.max(1, p - 1))} disabled={page === 1} className="btn-secondary px-3 py-1 text-xs">Previous</button>
              <button onClick={() => setPage((p) => Math.min(totalPages, p + 1))} disabled={page === totalPages} className="btn-secondary px-3 py-1 text-xs">Next</button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

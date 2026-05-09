'use client';

import { useState } from 'react';
import useSWR from 'swr';
import Link from 'next/link';
import { Search } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PaginatedResponse, SavingsAccount } from '@/lib/types';
import { Badge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

export default function SavingsPage() {
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);

  const query = new URLSearchParams({ page: String(page), page_size: '20' });
  if (search) query.set('search', search);

  const { data, isLoading } = useSWR<PaginatedResponse<SavingsAccount>>(
    `/savings/?${query}`,
    fetcher,
    { keepPreviousData: true },
  );

  if (isLoading && !data) return <PageLoader />;

  const accounts = data?.results ?? [];
  const totalPages = Math.ceil((data?.count ?? 0) / 20) || 1;
  const totalBalance = accounts.reduce((sum, a) => sum + a.balance, 0);

  return (
    <div className="p-4 sm:p-6 space-y-4 sm:space-y-5">
      <div>
        <h1 className="text-xl font-bold text-slate-900">Savings Accounts</h1>
        <p className="text-sm text-slate-500">
          {data?.count ?? 0} accounts · {fmt.currency(totalBalance)} on this page
        </p>
      </div>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
        <input
          className="input pl-9 sm:max-w-sm"
          placeholder="Search by client name or account number..."
          value={search}
          onChange={(e) => { setSearch(e.target.value); setPage(1); }}
        />
      </div>

      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full min-w-[680px]">
            <thead>
              <tr>
                <th className="table-header">Account #</th>
                <th className="table-header">Client</th>
                <th className="table-header">Type</th>
                <th className="table-header">Balance</th>
                <th className="table-header">Min. Balance</th>
                <th className="table-header">Interest Rate</th>
                <th className="table-header">Opened</th>
                <th className="table-header">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {accounts.length === 0 && (
                <tr>
                  <td colSpan={8} className="text-center py-12 text-slate-400 text-sm">
                    {search ? 'No accounts match your search' : 'No savings accounts yet'}
                  </td>
                </tr>
              )}
              {accounts.map((acc) => (
                <tr key={acc.id} className="hover:bg-slate-50">
                  <td className="table-cell font-mono text-xs">{acc.account_number}</td>
                  <td className="table-cell">
                    <Link href={`/clients/${acc.client.id}`} className="font-medium hover:text-blue-600">
                      {acc.client.full_name}
                    </Link>
                  </td>
                  <td className="table-cell text-slate-600 capitalize">{acc.account_type}</td>
                  <td className="table-cell font-bold text-emerald-700">{fmt.currency(acc.balance)}</td>
                  <td className="table-cell text-slate-600">{fmt.currency(acc.minimum_balance)}</td>
                  <td className="table-cell text-slate-600">{acc.interest_rate}%</td>
                  <td className="table-cell text-slate-500">{fmt.date(acc.opened_at)}</td>
                  <td className="table-cell">
                    <Badge variant={acc.is_active ? 'green' : 'gray'}>
                      {acc.is_active ? 'Active' : 'Closed'}
                    </Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {totalPages > 1 && (
          <div className="flex items-center justify-between px-4 sm:px-5 py-3 border-t border-slate-100">
            <p className="text-xs text-slate-500">Page {page} of {totalPages}</p>
            <div className="flex gap-2">
              <button onClick={() => setPage((p) => Math.max(1, p - 1))} disabled={page === 1} className="btn-secondary px-3 py-1 text-xs">Prev</button>
              <button onClick={() => setPage((p) => Math.min(totalPages, p + 1))} disabled={page === totalPages} className="btn-secondary px-3 py-1 text-xs">Next</button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

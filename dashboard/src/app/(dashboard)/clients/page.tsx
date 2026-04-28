'use client';

import { useState } from 'react';
import useSWR from 'swr';
import Link from 'next/link';
import { Search, UserPlus } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PaginatedResponse, Client } from '@/lib/types';
import { Badge, statusBadge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

export default function ClientsPage() {
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);

  const query = new URLSearchParams({ page: String(page), page_size: '20' });
  if (search) query.set('search', search);

  const { data, isLoading } = useSWR<PaginatedResponse<Client>>(
    `/clients/?${query}`,
    fetcher,
    { keepPreviousData: true },
  );

  function handleSearch(e: React.ChangeEvent<HTMLInputElement>) {
    setSearch(e.target.value);
    setPage(1);
  }

  if (isLoading && !data) return <PageLoader />;

  const clients = data?.results ?? [];
  const totalPages = data ? Math.ceil(data.count / 20) : 1;

  return (
    <div className="p-6 space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-slate-900">Clients</h1>
          <p className="text-sm text-slate-500">{data?.count ?? 0} total clients</p>
        </div>
      </div>

      <div className="flex gap-3">
        <div className="relative flex-1 max-w-sm">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
          <input
            className="input pl-9"
            placeholder="Search by name, ID or phone..."
            value={search}
            onChange={handleSearch}
          />
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        {isLoading && (
          <div className="px-5 py-2 bg-blue-50 text-xs text-blue-600 font-medium">Updating...</div>
        )}
        <table className="w-full">
          <thead>
            <tr>
              <th className="table-header">Name</th>
              <th className="table-header">National ID</th>
              <th className="table-header">Phone</th>
              <th className="table-header">Branch</th>
              <th className="table-header">Registered</th>
              <th className="table-header">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-50">
            {clients.length === 0 && (
              <tr>
                <td colSpan={6} className="text-center py-12 text-slate-400 text-sm">
                  {search ? 'No clients match your search' : 'No clients registered yet'}
                </td>
              </tr>
            )}
            {clients.map((c) => (
              <tr key={c.id} className="hover:bg-slate-50">
                <td className="table-cell">
                  <Link href={`/clients/${c.id}`} className="font-medium text-blue-600 hover:underline">
                    {c.full_name}
                  </Link>
                </td>
                <td className="table-cell text-slate-600 font-mono text-xs">{c.national_id}</td>
                <td className="table-cell text-slate-600">{c.phone_number}</td>
                <td className="table-cell text-slate-600">{c.branch_name ?? '—'}</td>
                <td className="table-cell text-slate-500">{fmt.date(c.created_at)}</td>
                <td className="table-cell">
                  <Badge variant={c.is_active ? 'green' : 'gray'}>
                    {c.is_active ? 'Active' : 'Inactive'}
                  </Badge>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

        {totalPages > 1 && (
          <div className="flex items-center justify-between px-5 py-3 border-t border-slate-100">
            <p className="text-xs text-slate-500">
              Page {page} of {totalPages} — {data?.count} records
            </p>
            <div className="flex gap-2">
              <button
                onClick={() => setPage((p) => Math.max(1, p - 1))}
                disabled={page === 1}
                className="btn-secondary px-3 py-1 text-xs"
              >
                Previous
              </button>
              <button
                onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
                disabled={page === totalPages}
                className="btn-secondary px-3 py-1 text-xs"
              >
                Next
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

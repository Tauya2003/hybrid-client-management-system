'use client';

import { useState } from 'react';
import useSWR from 'swr';
import Link from 'next/link';
import { Search } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PaginatedResponse, Group } from '@/lib/types';
import { Badge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

export default function GroupsPage() {
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);

  const query = new URLSearchParams({ page: String(page), page_size: '20' });
  if (search) query.set('search', search);

  const { data, isLoading } = useSWR<PaginatedResponse<Group>>(
    `/groups/?${query}`,
    fetcher,
    { keepPreviousData: true },
  );

  if (isLoading && !data) return <PageLoader />;

  const groups = data?.results ?? [];
  const totalPages = Math.ceil((data?.count ?? 0) / 20) || 1;

  return (
    <div className="p-6 space-y-5">
      <div>
        <h1 className="text-xl font-bold text-slate-900">Groups</h1>
        <p className="text-sm text-slate-500">{data?.count ?? 0} groups</p>
      </div>

      <div className="relative max-w-sm">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
        <input
          className="input pl-9"
          placeholder="Search groups..."
          value={search}
          onChange={(e) => { setSearch(e.target.value); setPage(1); }}
        />
      </div>

      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        <table className="w-full">
          <thead>
            <tr>
              <th className="table-header">Group Name</th>
              <th className="table-header">Type</th>
              <th className="table-header">Branch</th>
              <th className="table-header">Field Officer</th>
              <th className="table-header">Members</th>
              <th className="table-header">Meeting</th>
              <th className="table-header">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-50">
            {groups.length === 0 && (
              <tr>
                <td colSpan={7} className="text-center py-12 text-slate-400 text-sm">
                  {search ? 'No groups match your search' : 'No groups registered yet'}
                </td>
              </tr>
            )}
            {groups.map((g) => (
              <tr key={g.id} className="hover:bg-slate-50">
                <td className="table-cell font-medium">{g.name}</td>
                <td className="table-cell">
                  <Badge variant={g.group_type === 'solidarity' ? 'blue' : 'purple'}>
                    {g.group_type}
                  </Badge>
                </td>
                <td className="table-cell text-slate-600">{g.branch?.name ?? '—'}</td>
                <td className="table-cell text-slate-600">{g.field_officer?.full_name ?? '—'}</td>
                <td className="table-cell font-medium">{g.member_count}</td>
                <td className="table-cell text-slate-500 capitalize">
                  {g.meeting_day} · {g.meeting_frequency}
                </td>
                <td className="table-cell">
                  <Badge variant={g.is_active ? 'green' : 'gray'}>
                    {g.is_active ? 'Active' : 'Inactive'}
                  </Badge>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

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

'use client';

import useSWR from 'swr';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft, CreditCard, PiggyBank } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { Client, Loan, SavingsAccount } from '@/lib/types';
import { Badge, statusBadge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex gap-4 py-2.5 border-b border-slate-50 last:border-0">
      <span className="w-36 text-xs text-slate-500 font-medium flex-shrink-0 pt-0.5">{label}</span>
      <span className="text-sm text-slate-900">{value || '—'}</span>
    </div>
  );
}

export default function ClientDetailPage() {
  const { id } = useParams<{ id: string }>();

  const { data: client, isLoading } = useSWR<Client>(`/clients/${id}/`, fetcher);
  const { data: loansData } = useSWR<{ results: Loan[] }>(`/loans/?client=${id}`, fetcher);
  const { data: savingsData } = useSWR<{ results: SavingsAccount[] }>(`/savings/?client=${id}`, fetcher);

  if (isLoading) return <PageLoader />;
  if (!client) return <div className="p-6 text-slate-500">Client not found.</div>;

  const loans = loansData?.results ?? [];
  const savings = savingsData?.results ?? [];

  const genderLabel = { M: 'Male', F: 'Female', O: 'Other' }[client.gender] ?? client.gender;

  return (
    <div className="p-6 space-y-5 max-w-4xl">
      <div className="flex items-center gap-3">
        <Link href="/clients" className="text-slate-400 hover:text-slate-600">
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-slate-900">{client.full_name}</h1>
          <p className="text-sm text-slate-500">Client profile</p>
        </div>
        <div className="ml-auto">
          <Badge variant={client.is_active ? 'green' : 'gray'}>
            {client.is_active ? 'Active' : 'Inactive'}
          </Badge>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        {/* Personal details */}
        <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-3">Personal Information</h2>
          <InfoRow label="National ID" value={client.national_id} />
          <InfoRow label="Phone" value={client.phone_number} />
          <InfoRow label="Date of Birth" value={fmt.date(client.date_of_birth)} />
          <InfoRow label="Gender" value={genderLabel} />
          <InfoRow label="Address" value={client.address} />
          <InfoRow label="Branch" value={client.branch_name ?? '—'} />
          <InfoRow label="Registered" value={fmt.date(client.created_at)} />
        </div>

        {/* Next of kin */}
        <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-3">Next of Kin</h2>
          <InfoRow label="Name" value={client.next_of_kin_name} />
          <InfoRow label="Phone" value={client.next_of_kin_phone} />
        </div>
      </div>

      {/* Loans */}
      <div className="bg-white rounded-xl border border-slate-100 shadow-sm">
        <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-50">
          <CreditCard className="w-4 h-4 text-slate-400" />
          <h2 className="text-sm font-semibold text-slate-700">Loans ({loans.length})</h2>
        </div>
        {loans.length === 0 ? (
          <p className="text-center py-8 text-slate-400 text-sm">No loans</p>
        ) : (
          <table className="w-full">
            <thead>
              <tr>
                <th className="table-header">Loan #</th>
                <th className="table-header">Product</th>
                <th className="table-header">Principal</th>
                <th className="table-header">Outstanding</th>
                <th className="table-header">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {loans.map((loan) => (
                <tr key={loan.id} className="hover:bg-slate-50">
                  <td className="table-cell">
                    <Link href={`/loans/${loan.id}`} className="text-blue-600 hover:underline font-mono text-xs">
                      {loan.loan_number}
                    </Link>
                  </td>
                  <td className="table-cell text-slate-600">{loan.product_name}</td>
                  <td className="table-cell font-medium">{fmt.currency(loan.principal_amount)}</td>
                  <td className="table-cell font-medium">{fmt.currency(loan.outstanding_balance)}</td>
                  <td className="table-cell">
                    <Badge variant={statusBadge(loan.status)}>{loan.status}</Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Savings */}
      <div className="bg-white rounded-xl border border-slate-100 shadow-sm">
        <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-50">
          <PiggyBank className="w-4 h-4 text-slate-400" />
          <h2 className="text-sm font-semibold text-slate-700">Savings Accounts ({savings.length})</h2>
        </div>
        {savings.length === 0 ? (
          <p className="text-center py-8 text-slate-400 text-sm">No savings accounts</p>
        ) : (
          <table className="w-full">
            <thead>
              <tr>
                <th className="table-header">Account #</th>
                <th className="table-header">Type</th>
                <th className="table-header">Balance</th>
                <th className="table-header">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {savings.map((acc) => (
                <tr key={acc.id} className="hover:bg-slate-50">
                  <td className="table-cell font-mono text-xs">{acc.account_number}</td>
                  <td className="table-cell text-slate-600 capitalize">{acc.account_type}</td>
                  <td className="table-cell font-bold text-emerald-700">{fmt.currency(acc.balance)}</td>
                  <td className="table-cell">
                    <Badge variant={acc.is_active ? 'green' : 'gray'}>
                      {acc.is_active ? 'Active' : 'Closed'}
                    </Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}

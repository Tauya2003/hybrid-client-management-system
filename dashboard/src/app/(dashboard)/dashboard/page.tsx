'use client';

import useSWR from 'swr';
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  PieChart, Pie, Cell, Legend,
} from 'recharts';
import { Users, CreditCard, TrendingDown, PiggyBank, FileText, AlertTriangle } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PortfolioSummary, LoanApplication } from '@/lib/types';
import { StatCard } from '@/components/ui/StatCard';
import { Badge, statusBadge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import Link from 'next/link';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

const PAR_COLORS = ['#3b82f6', '#f59e0b', '#f97316', '#ef4444'];

export default function DashboardPage() {
  const { data: summary, isLoading: sumLoading } = useSWR<PortfolioSummary>(
    '/reports/portfolio/',
    fetcher,
    { refreshInterval: 30_000 },
  );
  const { data: appsData, isLoading: appsLoading } = useSWR<{ results: LoanApplication[] }>(
    '/loan-applications/?status=submitted&page_size=5',
    fetcher,
    { refreshInterval: 30_000 },
  );

  if (sumLoading) return <PageLoader />;

  const s = summary!;

  const parData = [
    { name: 'PAR 1+', value: s.par.par_1, rate: s.par.par_1_rate },
    { name: 'PAR 30+', value: s.par.par_30, rate: s.par.par_30_rate },
    { name: 'PAR 60+', value: s.par.par_60, rate: s.par.par_60_rate },
    { name: 'PAR 90+', value: s.par.par_90, rate: s.par.par_90_rate },
  ];

  const appStatusData = [
    { name: 'Draft', value: s.loan_applications.draft, color: '#94a3b8' },
    { name: 'Submitted', value: s.loan_applications.submitted, color: '#f59e0b' },
    { name: 'Approved', value: s.loan_applications.approved, color: '#3b82f6' },
    { name: 'Disbursed', value: s.loan_applications.disbursed, color: '#22c55e' },
    { name: 'Rejected', value: s.loan_applications.rejected, color: '#ef4444' },
  ].filter((d) => d.value > 0);

  return (
    <div className="p-4 sm:p-6 space-y-4 sm:space-y-6">
      <div>
        <h1 className="text-xl font-bold text-slate-900">Portfolio Dashboard</h1>
        <p className="text-sm text-slate-500 mt-0.5">Real-time microfinance portfolio overview</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
        <StatCard
          label="Active Clients"
          value={s.active_clients.toLocaleString()}
          sub={`${s.total_clients} total`}
          icon={Users}
          iconColor="text-blue-600"
        />
        <StatCard
          label="Active Loans"
          value={s.active_loans.count.toLocaleString()}
          sub={fmt.currency(s.active_loans.total_outstanding) + ' outstanding'}
          icon={CreditCard}
          iconColor="text-emerald-600"
        />
        <StatCard
          label="PAR 30+"
          value={fmt.pct(s.par.par_30_rate)}
          sub={fmt.currency(s.par.par_30) + ' at risk'}
          icon={AlertTriangle}
          iconColor={s.par.par_30_rate > 5 ? 'text-red-600' : 'text-yellow-600'}
        />
        <StatCard
          label="Total Savings"
          value={fmt.currency(s.savings.total_balance)}
          sub={`${s.savings.total_accounts} accounts`}
          icon={PiggyBank}
          iconColor="text-purple-600"
        />
      </div>

      {/* Charts row */}
      <div className="grid grid-cols-1 xl:grid-cols-3 gap-4">
        {/* PAR bar chart */}
        <div className="xl:col-span-2 bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-4">Portfolio at Risk (PAR)</h2>
          <ResponsiveContainer width="100%" height={200}>
            <BarChart data={parData} margin={{ top: 4, right: 8, left: 0, bottom: 0 }}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" />
              <XAxis dataKey="name" tick={{ fontSize: 11 }} />
              <YAxis
                tickFormatter={(v) => fmt.currency(v).replace('$', '$').split('.')[0]}
                tick={{ fontSize: 10 }}
                width={64}
              />
              <Tooltip
                formatter={(v: number) => [fmt.currency(v), 'Outstanding']}
                labelStyle={{ fontWeight: 600 }}
              />
              <Bar dataKey="value" radius={[4, 4, 0, 0]}>
                {parData.map((_, i) => (
                  <Cell key={i} fill={PAR_COLORS[i]} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
          <div className="grid grid-cols-4 gap-2 mt-4 pt-4 border-t border-slate-50">
            {parData.map((d, i) => (
              <div key={d.name} className="text-center">
                <div className="text-base sm:text-lg font-bold" style={{ color: PAR_COLORS[i] }}>
                  {fmt.pct(d.rate)}
                </div>
                <div className="text-xs text-slate-500">{d.name}</div>
              </div>
            ))}
          </div>
        </div>

        {/* Application status pie */}
        <div className="bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-slate-700 mb-4">Loan Applications</h2>
          {appStatusData.length > 0 ? (
            <ResponsiveContainer width="100%" height={200}>
              <PieChart>
                <Pie
                  data={appStatusData}
                  cx="50%"
                  cy="50%"
                  innerRadius={50}
                  outerRadius={80}
                  dataKey="value"
                  paddingAngle={2}
                >
                  {appStatusData.map((d, i) => (
                    <Cell key={i} fill={d.color} />
                  ))}
                </Pie>
                <Legend iconType="circle" iconSize={8} wrapperStyle={{ fontSize: 12 }} />
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          ) : (
            <div className="flex items-center justify-center h-48 text-slate-400 text-sm">
              No applications yet
            </div>
          )}
          <div className="text-center mt-2">
            <p className="text-2xl font-bold text-slate-900">{s.loan_applications.total}</p>
            <p className="text-xs text-slate-500">total applications</p>
          </div>
        </div>
      </div>

      {/* Portfolio KPIs */}
      <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
        <div className="bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <div className="flex items-center gap-2 mb-1">
            <TrendingDown className="w-4 h-4 text-slate-400" />
            <span className="text-xs text-slate-500 font-medium uppercase tracking-wide">Total Disbursed</span>
          </div>
          <p className="text-xl font-bold text-slate-900">{fmt.currency(s.active_loans.total_disbursed)}</p>
        </div>
        <div className="bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <div className="flex items-center gap-2 mb-1">
            <CreditCard className="w-4 h-4 text-slate-400" />
            <span className="text-xs text-slate-500 font-medium uppercase tracking-wide">Total Repaid</span>
          </div>
          <p className="text-xl font-bold text-slate-900">{fmt.currency(s.active_loans.total_repaid)}</p>
        </div>
        <div className="bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <div className="flex items-center gap-2 mb-1">
            <Users className="w-4 h-4 text-slate-400" />
            <span className="text-xs text-slate-500 font-medium uppercase tracking-wide">Groups</span>
          </div>
          <p className="text-xl font-bold text-slate-900">{s.total_groups}</p>
        </div>
        <div className="bg-white rounded-xl border border-slate-100 p-4 sm:p-5 shadow-sm">
          <div className="flex items-center gap-2 mb-1">
            <FileText className="w-4 h-4 text-slate-400" />
            <span className="text-xs text-slate-500 font-medium uppercase tracking-wide">Pending Review</span>
          </div>
          <p className="text-xl font-bold text-slate-900">{s.loan_applications.submitted}</p>
        </div>
      </div>

      {/* Pending applications */}
      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        <div className="flex items-center justify-between px-4 sm:px-5 py-4 border-b border-slate-50">
          <h2 className="text-sm font-semibold text-slate-700">Pending Loan Applications</h2>
          <Link href="/loans" className="text-xs text-blue-600 hover:underline">View all</Link>
        </div>
        {appsLoading ? (
          <div className="p-8 text-center text-slate-400 text-sm">Loading...</div>
        ) : appsData?.results.length === 0 ? (
          <div className="p-8 text-center text-slate-400 text-sm">No pending applications</div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[520px]">
              <thead>
                <tr>
                  <th className="table-header">Client</th>
                  <th className="table-header">Product</th>
                  <th className="table-header">Amount</th>
                  <th className="table-header">Applied</th>
                  <th className="table-header">Status</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-50">
                {appsData?.results.map((app) => (
                  <tr key={app.id} className="hover:bg-slate-50">
                    <td className="table-cell font-medium">{app.client_name}</td>
                    <td className="table-cell text-slate-500">{app.product_name}</td>
                    <td className="table-cell font-medium">{fmt.currency(app.amount_requested)}</td>
                    <td className="table-cell text-slate-500">{fmt.date(app.applied_at)}</td>
                    <td className="table-cell">
                      <Badge variant={statusBadge(app.status)}>{app.status}</Badge>
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

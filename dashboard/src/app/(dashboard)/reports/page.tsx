'use client';

import useSWR from 'swr';
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  RadialBarChart, RadialBar, PolarAngleAxis,
} from 'recharts';
import { TrendingDown, TrendingUp, AlertTriangle, CheckCircle } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { PortfolioSummary } from '@/lib/types';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import clsx from 'clsx';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

function PARGauge({ rate, label, threshold }: { rate: number; label: string; threshold: number }) {
  const isHealthy = rate <= threshold;
  const data = [{ value: Math.min(rate, 100), fill: isHealthy ? '#22c55e' : '#ef4444' }];

  return (
    <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm text-center">
      <div className="relative">
        <ResponsiveContainer width="100%" height={130}>
          <RadialBarChart cx="50%" cy="80%" innerRadius="60%" outerRadius="90%" startAngle={180} endAngle={0} data={data}>
            <PolarAngleAxis type="number" domain={[0, 20]} angleAxisId={0} tick={false} />
            <RadialBar dataKey="value" cornerRadius={4} background={{ fill: '#f1f5f9' }} />
          </RadialBarChart>
        </ResponsiveContainer>
        <div className="absolute inset-0 flex flex-col items-center justify-end pb-2">
          <span className={clsx('text-2xl font-bold', isHealthy ? 'text-green-600' : 'text-red-600')}>
            {fmt.pct(rate)}
          </span>
        </div>
      </div>
      <p className="text-sm font-semibold text-slate-700 mt-1">{label}</p>
      <div className={clsx('flex items-center justify-center gap-1 mt-1 text-xs', isHealthy ? 'text-green-600' : 'text-red-600')}>
        {isHealthy
          ? <><CheckCircle className="w-3 h-3" /> Healthy (&le;{threshold}%)</>
          : <><AlertTriangle className="w-3 h-3" /> Above threshold</>
        }
      </div>
    </div>
  );
}

export default function ReportsPage() {
  const { data: summary, isLoading } = useSWR<PortfolioSummary>(
    '/reports/portfolio/',
    fetcher,
    { refreshInterval: 60_000 },
  );

  if (isLoading) return <PageLoader />;
  if (!summary) return <div className="p-6 text-slate-500">Could not load report data.</div>;

  const s = summary;

  const parBarData = [
    { name: 'PAR 1+', outstanding: s.par.par_1, rate: s.par.par_1_rate },
    { name: 'PAR 30+', outstanding: s.par.par_30, rate: s.par.par_30_rate },
    { name: 'PAR 60+', outstanding: s.par.par_60, rate: s.par.par_60_rate },
    { name: 'PAR 90+', outstanding: s.par.par_90, rate: s.par.par_90_rate },
  ];

  const loanFlowData = [
    { name: 'Disbursed', value: s.active_loans.total_disbursed },
    { name: 'Repaid', value: s.active_loans.total_repaid },
    { name: 'Outstanding', value: s.active_loans.total_outstanding },
  ];

  const collectionRate = s.active_loans.total_disbursed > 0
    ? (s.active_loans.total_repaid / s.active_loans.total_disbursed) * 100
    : 0;

  return (
    <div className="p-4 sm:p-6 space-y-4 sm:space-y-6">
      <div>
        <h1 className="text-xl font-bold text-slate-900">Portfolio Report</h1>
        <p className="text-sm text-slate-500">Branch-wide portfolio health and performance metrics</p>
      </div>

      {/* Key metrics */}
      <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
        {[
          {
            label: 'Collection Rate',
            value: fmt.pct(collectionRate),
            sub: 'repaid / disbursed',
            good: collectionRate >= 90,
            icon: collectionRate >= 90 ? TrendingUp : TrendingDown,
          },
          {
            label: 'Total Outstanding',
            value: fmt.currency(s.active_loans.total_outstanding),
            sub: `${s.active_loans.count} active loans`,
            good: true,
            icon: TrendingUp,
          },
          {
            label: 'PAR 30+ Rate',
            value: fmt.pct(s.par.par_30_rate),
            sub: 'portfolio at risk',
            good: s.par.par_30_rate <= 5,
            icon: s.par.par_30_rate <= 5 ? CheckCircle : AlertTriangle,
          },
          {
            label: 'Total Savings',
            value: fmt.currency(s.savings.total_balance),
            sub: `${s.savings.total_accounts} accounts`,
            good: true,
            icon: TrendingUp,
          },
        ].map(({ label, value, sub, good, icon: Icon }) => (
          <div key={label} className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
            <div className="flex items-center justify-between mb-1">
              <span className="text-xs text-slate-500 font-medium uppercase tracking-wide">{label}</span>
              <Icon className={clsx('w-4 h-4', good ? 'text-green-500' : 'text-red-500')} />
            </div>
            <p className="text-2xl font-bold text-slate-900">{value}</p>
            <p className="text-xs text-slate-400 mt-0.5">{sub}</p>
          </div>
        ))}
      </div>

      {/* PAR Gauges */}
      <div>
        <h2 className="text-sm font-semibold text-slate-700 mb-3">Portfolio at Risk (PAR) Breakdown</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
          <PARGauge rate={s.par.par_1_rate} label="PAR 1+ days" threshold={10} />
          <PARGauge rate={s.par.par_30_rate} label="PAR 30+ days" threshold={5} />
          <PARGauge rate={s.par.par_60_rate} label="PAR 60+ days" threshold={3} />
          <PARGauge rate={s.par.par_90_rate} label="PAR 90+ days" threshold={2} />
        </div>
      </div>

      {/* PAR outstanding amounts */}
      <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
        <h2 className="text-sm font-semibold text-slate-700 mb-4">Outstanding by PAR Category</h2>
        <ResponsiveContainer width="100%" height={220}>
          <BarChart data={parBarData} margin={{ top: 4, right: 8, left: 8, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" />
            <XAxis dataKey="name" tick={{ fontSize: 12 }} />
            <YAxis
              tickFormatter={(v) => `$${(v / 1000).toFixed(0)}k`}
              tick={{ fontSize: 11 }}
              width={56}
            />
            <Tooltip
              formatter={(v: number) => [fmt.currency(v), 'Outstanding']}
              labelStyle={{ fontWeight: 600 }}
            />
            <Bar dataKey="outstanding" fill="#ef4444" radius={[4, 4, 0, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>

      {/* Loan flow */}
      <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
        <h2 className="text-sm font-semibold text-slate-700 mb-4">Loan Portfolio Flow</h2>
        <ResponsiveContainer width="100%" height={180}>
          <BarChart data={loanFlowData} layout="vertical" margin={{ top: 0, right: 16, left: 16, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" horizontal={false} />
            <XAxis
              type="number"
              tickFormatter={(v) => `$${(v / 1000).toFixed(0)}k`}
              tick={{ fontSize: 11 }}
            />
            <YAxis type="category" dataKey="name" tick={{ fontSize: 12 }} width={80} />
            <Tooltip formatter={(v: number) => [fmt.currency(v)]} />
            <Bar dataKey="value" fill="#3b82f6" radius={[0, 4, 4, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>

      {/* Loan applications pipeline */}
      <div className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
        <h2 className="text-sm font-semibold text-slate-700 mb-4">Application Pipeline</h2>
        <div className="grid grid-cols-3 sm:grid-cols-5 gap-2 sm:gap-0">
          {[
            { label: 'Draft', count: s.loan_applications.draft, color: 'bg-slate-200 text-slate-700' },
            { label: 'Submitted', count: s.loan_applications.submitted, color: 'bg-yellow-100 text-yellow-800' },
            { label: 'Approved', count: s.loan_applications.approved, color: 'bg-blue-100 text-blue-800' },
            { label: 'Disbursed', count: s.loan_applications.disbursed, color: 'bg-green-100 text-green-800' },
            { label: 'Rejected', count: s.loan_applications.rejected, color: 'bg-red-100 text-red-800' },
          ].map((stage) => (
            <div key={stage.label} className="text-center px-2">
              <div className={clsx('rounded-xl py-4 mb-2', stage.color)}>
                <p className="text-2xl font-bold">{stage.count}</p>
              </div>
              <p className="text-xs font-medium text-slate-600">{stage.label}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

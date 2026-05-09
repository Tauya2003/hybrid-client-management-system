'use client';

import { useState } from 'react';
import useSWR from 'swr';
import { Plus, CreditCard } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { LoanProduct } from '@/lib/types';
import { Badge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import { Modal, FormField } from '@/components/ui/Modal';
import { useAuth } from '@/contexts/AuthContext';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

const empty = {
  name: '', description: '',
  min_amount: '', max_amount: '',
  interest_rate: '', interest_type: 'flat',
  repayment_frequency: 'monthly',
  min_term: '', max_term: '',
  processing_fee_rate: '0', late_penalty_rate: '0',
};

export default function LoanProductsPage() {
  const { user } = useAuth();
  const { data, isLoading, mutate } = useSWR<{ results: LoanProduct[] }>('/loan-products/', fetcher);
  const [open, setOpen] = useState(false);
  const [form, setForm] = useState(empty);
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [submitting, setSubmitting] = useState(false);
  const [serverError, setServerError] = useState('');

  const isAdmin = user?.role === 'admin';

  function set(field: string, value: string) {
    setForm((f) => ({ ...f, [field]: value }));
    setErrors((e) => ({ ...e, [field]: '' }));
  }

  function validate() {
    const e: Record<string, string> = {};
    if (!form.name.trim()) e.name = 'Product name is required';

    const minAmt = Number(form.min_amount);
    const maxAmt = Number(form.max_amount);
    if (!form.min_amount || isNaN(minAmt) || minAmt <= 0) e.min_amount = 'Enter a positive amount';
    if (!form.max_amount || isNaN(maxAmt) || maxAmt <= 0) e.max_amount = 'Enter a positive amount';
    if (!e.min_amount && !e.max_amount && minAmt >= maxAmt) e.max_amount = 'Max must be greater than min';

    const rate = Number(form.interest_rate);
    if (form.interest_rate === '' || isNaN(rate) || rate < 0) e.interest_rate = 'Enter a valid rate (0 or greater)';

    const minTerm = Number(form.min_term);
    const maxTerm = Number(form.max_term);
    if (!form.min_term || isNaN(minTerm) || minTerm < 1 || !Number.isInteger(minTerm)) e.min_term = 'Enter a whole number ≥ 1';
    if (!form.max_term || isNaN(maxTerm) || maxTerm < 1 || !Number.isInteger(maxTerm)) e.max_term = 'Enter a whole number ≥ 1';
    if (!e.min_term && !e.max_term && minTerm > maxTerm) e.max_term = 'Max term must be ≥ min term';

    const fee = Number(form.processing_fee_rate);
    if (form.processing_fee_rate !== '' && (isNaN(fee) || fee < 0)) e.processing_fee_rate = 'Must be 0 or greater';
    const penalty = Number(form.late_penalty_rate);
    if (form.late_penalty_rate !== '' && (isNaN(penalty) || penalty < 0)) e.late_penalty_rate = 'Must be 0 or greater';

    setErrors(e);
    return Object.keys(e).length === 0;
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!validate()) return;
    setSubmitting(true);
    setServerError('');
    try {
      await api.post('/loan-products/', {
        ...form,
        min_amount: Number(form.min_amount),
        max_amount: Number(form.max_amount),
        interest_rate: Number(form.interest_rate),
        min_term: Number(form.min_term),
        max_term: Number(form.max_term),
        processing_fee_rate: Number(form.processing_fee_rate) || 0,
        late_penalty_rate: Number(form.late_penalty_rate) || 0,
      });
      mutate();
      setOpen(false);
      setForm(empty);
    } catch (err: unknown) {
      const data = (err as { response?: { data?: unknown } })?.response?.data;
      setServerError(
        typeof data === 'object' && data !== null
          ? Object.entries(data as Record<string, string[]>)
              .map(([k, v]) => `${k}: ${v.join(', ')}`)
              .join(' | ')
          : 'Failed to create loan product.',
      );
    } finally {
      setSubmitting(false);
    }
  }

  function closeModal() {
    setOpen(false);
    setForm(empty);
    setErrors({});
    setServerError('');
  }

  if (isLoading) return <PageLoader />;
  const products = data?.results ?? [];

  return (
    <div className="p-4 sm:p-6 space-y-4 sm:space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-slate-900">Loan Products</h1>
          <p className="text-sm text-slate-500">{products.length} product{products.length !== 1 ? 's' : ''}</p>
        </div>
        {isAdmin && (
          <button onClick={() => setOpen(true)} className="btn-primary flex items-center gap-2">
            <Plus className="w-4 h-4" />
            New Product
          </button>
        )}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        {products.length === 0 && (
          <div className="col-span-full bg-white rounded-xl border border-slate-100 p-12 text-center">
            <CreditCard className="w-10 h-10 text-slate-300 mx-auto mb-3" />
            <p className="text-slate-500 font-medium">No loan products yet</p>
            <p className="text-sm text-slate-400 mt-1">Create products that field officers can offer to clients</p>
            {isAdmin && (
              <button onClick={() => setOpen(true)} className="btn-primary mt-4 inline-flex items-center gap-2">
                <Plus className="w-4 h-4" /> New Product
              </button>
            )}
          </div>
        )}
        {products.map((p) => (
          <div key={p.id} className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
            <div className="flex items-start justify-between mb-3">
              <div className="w-10 h-10 bg-emerald-100 rounded-xl flex items-center justify-center">
                <CreditCard className="w-5 h-5 text-emerald-600" />
              </div>
              <div className="flex gap-1.5">
                <Badge variant={p.interest_type === 'flat' ? 'blue' : 'purple'}>
                  {p.interest_type}
                </Badge>
                <Badge variant={p.is_active ? 'green' : 'gray'}>
                  {p.is_active ? 'Active' : 'Inactive'}
                </Badge>
              </div>
            </div>

            <h3 className="font-semibold text-slate-900">{p.name}</h3>

            <div className="mt-3 space-y-1.5">
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Loan Range</span>
                <span className="font-medium text-slate-700">
                  {fmt.currency(p.min_amount)} – {fmt.currency(p.max_amount)}
                </span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Interest Rate</span>
                <span className="font-medium text-slate-700">{p.interest_rate}% p.a.</span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Term</span>
                <span className="font-medium text-slate-700">
                  {p.min_term}–{p.max_term} periods
                </span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Frequency</span>
                <span className="font-medium text-slate-700 capitalize">{p.repayment_frequency}</span>
              </div>
            </div>
          </div>
        ))}
      </div>

      <Modal title="Create Loan Product" open={open} onClose={closeModal} width="max-w-xl">
        <form onSubmit={handleSubmit} className="space-y-4">
          {serverError && (
            <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-4 py-3">
              {serverError}
            </div>
          )}

          <FormField label="Product Name" error={errors.name} required>
            <input className="input" value={form.name} onChange={(e) => set('name', e.target.value)} placeholder="e.g. Group Solidarity Loan" />
          </FormField>

          <FormField label="Description">
            <textarea className="input resize-none" rows={2} value={form.description} onChange={(e) => set('description', e.target.value)} placeholder="Optional description" />
          </FormField>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FormField label="Min Amount (USD)" error={errors.min_amount} required>
              <input className="input" type="number" min="0" step="0.01" value={form.min_amount} onChange={(e) => set('min_amount', e.target.value)} placeholder="500" />
            </FormField>
            <FormField label="Max Amount (USD)" error={errors.max_amount} required>
              <input className="input" type="number" min="0" step="0.01" value={form.max_amount} onChange={(e) => set('max_amount', e.target.value)} placeholder="5000" />
            </FormField>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FormField label="Interest Rate (% p.a.)" error={errors.interest_rate} required>
              <input className="input" type="number" min="0" step="0.01" value={form.interest_rate} onChange={(e) => set('interest_rate', e.target.value)} placeholder="24" />
            </FormField>
            <FormField label="Interest Type" required>
              <select className="input" value={form.interest_type} onChange={(e) => set('interest_type', e.target.value)}>
                <option value="flat">Flat Rate</option>
                <option value="reducing">Reducing Balance</option>
              </select>
            </FormField>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FormField label="Min Term (periods)" error={errors.min_term} required>
              <input className="input" type="number" min="1" value={form.min_term} onChange={(e) => set('min_term', e.target.value)} placeholder="3" />
            </FormField>
            <FormField label="Max Term (periods)" error={errors.max_term} required>
              <input className="input" type="number" min="1" value={form.max_term} onChange={(e) => set('max_term', e.target.value)} placeholder="12" />
            </FormField>
          </div>

          <FormField label="Repayment Frequency" required>
            <select className="input" value={form.repayment_frequency} onChange={(e) => set('repayment_frequency', e.target.value)}>
              <option value="weekly">Weekly</option>
              <option value="biweekly">Bi-Weekly</option>
              <option value="monthly">Monthly</option>
            </select>
          </FormField>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FormField label="Processing Fee (%)" error={errors.processing_fee_rate}>
              <input className="input" type="number" min="0" step="0.01" value={form.processing_fee_rate} onChange={(e) => set('processing_fee_rate', e.target.value)} />
            </FormField>
            <FormField label="Late Penalty (% per period)" error={errors.late_penalty_rate}>
              <input className="input" type="number" min="0" step="0.01" value={form.late_penalty_rate} onChange={(e) => set('late_penalty_rate', e.target.value)} />
            </FormField>
          </div>

          <div className="flex gap-3 pt-2">
            <button type="button" onClick={closeModal} className="btn-secondary flex-1">Cancel</button>
            <button type="submit" disabled={submitting} className="btn-primary flex-1">
              {submitting ? 'Creating...' : 'Create Product'}
            </button>
          </div>
        </form>
      </Modal>
    </div>
  );
}

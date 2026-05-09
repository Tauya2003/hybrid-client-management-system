'use client';

import { useState } from 'react';
import useSWR from 'swr';
import { Plus, Building2 } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { Branch } from '@/lib/types';
import { Badge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import { Modal, FormField } from '@/components/ui/Modal';
import { useAuth } from '@/contexts/AuthContext';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

const empty = { name: '', code: '', address: '', phone: '', email: '' };

export default function BranchesPage() {
  const { user } = useAuth();
  const { data, isLoading, mutate } = useSWR<{ results: Branch[] }>('/auth/branches/', fetcher);
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

    if (!form.name.trim()) {
      e.name = 'Branch name is required';
    } else if (form.name.trim().length < 2) {
      e.name = 'Must be at least 2 characters';
    }

    if (!form.code.trim()) {
      e.code = 'Branch code is required';
    } else if (!/^[A-Z0-9\-]+$/.test(form.code.trim())) {
      e.code = 'Use uppercase letters, numbers and hyphens only (e.g. HRE-001)';
    }

    if (!form.address.trim()) e.address = 'Address is required';

    if (form.phone) {
      const digits = form.phone.replace(/[\s\-+()]/g, '');
      if (!/^\d{7,15}$/.test(digits)) e.phone = 'Enter a valid phone number (7–15 digits)';
    }

    if (form.email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
      e.email = 'Enter a valid email address';
    }

    setErrors(e);
    return Object.keys(e).length === 0;
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!validate()) return;
    setSubmitting(true);
    setServerError('');
    try {
      await api.post('/auth/branches/', form);
      mutate();
      setOpen(false);
      setForm(empty);
    } catch (err: unknown) {
      const data = (err as { response?: { data?: unknown } })?.response?.data;
      setServerError(
        typeof data === 'object' && data !== null
          ? Object.values(data as Record<string, string[]>).flat().join(' ')
          : 'Failed to create branch. Please try again.',
      );
    } finally {
      setSubmitting(false);
    }
  }

  if (isLoading) return <PageLoader />;
  const branches = data?.results ?? [];

  return (
    <div className="p-4 sm:p-6 space-y-4 sm:space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-slate-900">Branches</h1>
          <p className="text-sm text-slate-500">{branches.length} branch{branches.length !== 1 ? 'es' : ''}</p>
        </div>
        {isAdmin && (
          <button onClick={() => setOpen(true)} className="btn-primary flex items-center gap-2">
            <Plus className="w-4 h-4" />
            New Branch
          </button>
        )}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        {branches.length === 0 && (
          <div className="col-span-full bg-white rounded-xl border border-slate-100 p-12 text-center">
            <Building2 className="w-10 h-10 text-slate-300 mx-auto mb-3" />
            <p className="text-slate-500 font-medium">No branches yet</p>
            <p className="text-sm text-slate-400 mt-1">Create your first branch to get started</p>
            {isAdmin && (
              <button onClick={() => setOpen(true)} className="btn-primary mt-4 inline-flex items-center gap-2">
                <Plus className="w-4 h-4" /> New Branch
              </button>
            )}
          </div>
        )}
        {branches.map((b) => (
          <div key={b.id} className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm">
            <div className="flex items-start justify-between mb-3">
              <div className="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center">
                <Building2 className="w-5 h-5 text-blue-600" />
              </div>
              <Badge variant={b.is_active ? 'green' : 'gray'}>
                {b.is_active ? 'Active' : 'Inactive'}
              </Badge>
            </div>
            <h3 className="font-semibold text-slate-900">{b.name}</h3>
            <p className="text-xs font-mono text-slate-500 mt-0.5">{b.code}</p>
            <p className="text-sm text-slate-500 mt-2">{b.address}</p>
            {b.phone && <p className="text-sm text-slate-500">{b.phone}</p>}
            {b.email && <p className="text-sm text-slate-500">{b.email}</p>}
          </div>
        ))}
      </div>

      <Modal title="Create New Branch" open={open} onClose={() => { setOpen(false); setForm(empty); setErrors({}); setServerError(''); }}>
        <form onSubmit={handleSubmit} className="space-y-4">
          {serverError && (
            <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-4 py-3">
              {serverError}
            </div>
          )}

          <FormField label="Branch Name" error={errors.name} required>
            <input className="input" value={form.name} onChange={(e) => set('name', e.target.value)} placeholder="e.g. Harare Main Branch" />
          </FormField>

          <FormField label="Branch Code" error={errors.code} required>
            <input className="input" value={form.code} onChange={(e) => set('code', e.target.value.toUpperCase())} placeholder="e.g. HRE-001" />
          </FormField>

          <FormField label="Address" error={errors.address} required>
            <textarea className="input resize-none" rows={2} value={form.address} onChange={(e) => set('address', e.target.value)} placeholder="Physical address" />
          </FormField>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FormField label="Phone" error={errors.phone}>
              <input className="input" value={form.phone} onChange={(e) => set('phone', e.target.value)} placeholder="+263 77 000 0000" />
            </FormField>
            <FormField label="Email" error={errors.email}>
              <input className="input" type="email" value={form.email} onChange={(e) => set('email', e.target.value)} placeholder="branch@mfi.com" />
            </FormField>
          </div>

          <div className="flex gap-3 pt-2">
            <button type="button" onClick={() => setOpen(false)} className="btn-secondary flex-1">Cancel</button>
            <button type="submit" disabled={submitting} className="btn-primary flex-1">
              {submitting ? 'Creating...' : 'Create Branch'}
            </button>
          </div>
        </form>
      </Modal>
    </div>
  );
}

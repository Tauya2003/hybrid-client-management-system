'use client';

import { useState } from 'react';
import useSWR from 'swr';
import { Plus, Users } from 'lucide-react';
import { api, fmt } from '@/lib/api';
import type { Branch } from '@/lib/types';
import { Badge } from '@/components/ui/Badge';
import { PageLoader } from '@/components/ui/LoadingSpinner';
import { Modal, FormField } from '@/components/ui/Modal';
import { useAuth } from '@/contexts/AuthContext';

const fetcher = (url: string) => api.get(url).then((r) => r.data);

interface User {
  id: string;
  username: string;
  full_name: string;
  email: string;
  role: string;
  branch: Branch | null;
  phone_number: string;
  employee_id: string;
  is_active: boolean;
  date_joined: string;
}

const ROLES = [
  { value: 'field_officer', label: 'Field Officer' },
  { value: 'branch_manager', label: 'Branch Manager' },
  { value: 'admin', label: 'Admin' },
  { value: 'auditor', label: 'Auditor' },
];

const ROLE_COLORS: Record<string, 'blue' | 'green' | 'purple' | 'gray'> = {
  field_officer: 'blue',
  branch_manager: 'green',
  admin: 'purple',
  auditor: 'gray',
};

const empty = {
  username: '', password: '', first_name: '', last_name: '',
  email: '', role: 'field_officer', branch_id: '', phone_number: '', employee_id: '',
};

export default function UsersPage() {
  const { user: currentUser } = useAuth();
  const { data, isLoading, mutate } = useSWR<{ results: User[] }>('/auth/users/', fetcher);
  const { data: branchData } = useSWR<{ results: Branch[] }>('/auth/branches/', fetcher);

  const [open, setOpen] = useState(false);
  const [form, setForm] = useState(empty);
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [submitting, setSubmitting] = useState(false);
  const [serverError, setServerError] = useState('');

  const isAdmin = currentUser?.role === 'admin';
  const branches = branchData?.results ?? [];

  function set(field: string, value: string) {
    setForm((f) => ({ ...f, [field]: value }));
    setErrors((e) => ({ ...e, [field]: '' }));
  }

  function validate() {
    const e: Record<string, string> = {};
    if (!form.username.trim()) e.username = 'Username is required';
    if (!form.password || form.password.length < 8) e.password = 'Password must be at least 8 characters';
    if (!form.first_name.trim()) e.first_name = 'First name is required';
    if (!form.last_name.trim()) e.last_name = 'Last name is required';
    setErrors(e);
    return Object.keys(e).length === 0;
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!validate()) return;
    setSubmitting(true);
    setServerError('');
    try {
      const payload: Record<string, unknown> = { ...form };
      if (!payload.branch_id) delete payload.branch_id;
      if (!payload.employee_id) delete payload.employee_id;
      if (!payload.phone_number) delete payload.phone_number;
      await api.post('/auth/users/', payload);
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
          : 'Failed to create user.',
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
  const users = data?.results ?? [];

  return (
    <div className="p-6 space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-slate-900">Users</h1>
          <p className="text-sm text-slate-500">{users.length} user{users.length !== 1 ? 's' : ''}</p>
        </div>
        {isAdmin && (
          <button onClick={() => setOpen(true)} className="btn-primary flex items-center gap-2">
            <Plus className="w-4 h-4" />
            New User
          </button>
        )}
      </div>

      <div className="bg-white rounded-xl border border-slate-100 shadow-sm overflow-hidden">
        {users.length === 0 ? (
          <div className="p-12 text-center">
            <Users className="w-10 h-10 text-slate-300 mx-auto mb-3" />
            <p className="text-slate-500 font-medium">No users yet</p>
            {isAdmin && (
              <button onClick={() => setOpen(true)} className="btn-primary mt-4 inline-flex items-center gap-2">
                <Plus className="w-4 h-4" /> New User
              </button>
            )}
          </div>
        ) : (
          <table className="w-full">
            <thead>
              <tr>
                <th className="table-header">Name</th>
                <th className="table-header">Username</th>
                <th className="table-header">Role</th>
                <th className="table-header">Branch</th>
                <th className="table-header">Phone</th>
                <th className="table-header">Joined</th>
                <th className="table-header">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {users.map((u) => (
                <tr key={u.id} className="hover:bg-slate-50">
                  <td className="table-cell font-medium">{u.full_name}</td>
                  <td className="table-cell text-slate-500 font-mono text-xs">{u.username}</td>
                  <td className="table-cell">
                    <Badge variant={ROLE_COLORS[u.role] ?? 'gray'}>
                      {u.role.replace('_', ' ')}
                    </Badge>
                  </td>
                  <td className="table-cell text-slate-600">{u.branch?.name ?? '—'}</td>
                  <td className="table-cell text-slate-600">{u.phone_number || '—'}</td>
                  <td className="table-cell text-slate-500">{fmt.date(u.date_joined)}</td>
                  <td className="table-cell">
                    <Badge variant={u.is_active ? 'green' : 'gray'}>
                      {u.is_active ? 'Active' : 'Inactive'}
                    </Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      <Modal title="Create New User" open={open} onClose={closeModal} width="max-w-xl">
        <form onSubmit={handleSubmit} className="space-y-4">
          {serverError && (
            <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-4 py-3">
              {serverError}
            </div>
          )}

          <div className="grid grid-cols-2 gap-3">
            <FormField label="First Name" error={errors.first_name} required>
              <input className="input" value={form.first_name} onChange={(e) => set('first_name', e.target.value)} />
            </FormField>
            <FormField label="Last Name" error={errors.last_name} required>
              <input className="input" value={form.last_name} onChange={(e) => set('last_name', e.target.value)} />
            </FormField>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <FormField label="Username" error={errors.username} required>
              <input className="input" value={form.username} onChange={(e) => set('username', e.target.value)} autoComplete="off" />
            </FormField>
            <FormField label="Password" error={errors.password} required>
              <input className="input" type="password" value={form.password} onChange={(e) => set('password', e.target.value)} autoComplete="new-password" />
            </FormField>
          </div>

          <FormField label="Email">
            <input className="input" type="email" value={form.email} onChange={(e) => set('email', e.target.value)} />
          </FormField>

          <div className="grid grid-cols-2 gap-3">
            <FormField label="Role" required>
              <select className="input" value={form.role} onChange={(e) => set('role', e.target.value)}>
                {ROLES.map((r) => (
                  <option key={r.value} value={r.value}>{r.label}</option>
                ))}
              </select>
            </FormField>
            <FormField label="Branch">
              <select className="input" value={form.branch_id} onChange={(e) => set('branch_id', e.target.value)}>
                <option value="">— No branch —</option>
                {branches.map((b) => (
                  <option key={b.id} value={b.id}>{b.name}</option>
                ))}
              </select>
            </FormField>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <FormField label="Phone Number">
              <input className="input" value={form.phone_number} onChange={(e) => set('phone_number', e.target.value)} placeholder="+263 77 000 0000" />
            </FormField>
            <FormField label="Employee ID">
              <input className="input" value={form.employee_id} onChange={(e) => set('employee_id', e.target.value)} placeholder="EMP-001" />
            </FormField>
          </div>

          <div className="flex gap-3 pt-2">
            <button type="button" onClick={closeModal} className="btn-secondary flex-1">Cancel</button>
            <button type="submit" disabled={submitting} className="btn-primary flex-1">
              {submitting ? 'Creating...' : 'Create User'}
            </button>
          </div>
        </form>
      </Modal>
    </div>
  );
}

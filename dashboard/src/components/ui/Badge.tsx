import clsx from 'clsx';

const variants = {
  green: 'bg-green-100 text-green-800',
  red: 'bg-red-100 text-red-800',
  yellow: 'bg-yellow-100 text-yellow-800',
  blue: 'bg-blue-100 text-blue-800',
  gray: 'bg-slate-100 text-slate-700',
  orange: 'bg-orange-100 text-orange-800',
  purple: 'bg-purple-100 text-purple-800',
} as const;

type Variant = keyof typeof variants;

export function Badge({ children, variant = 'gray' }: { children: React.ReactNode; variant?: Variant }) {
  return (
    <span className={clsx('inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium', variants[variant])}>
      {children}
    </span>
  );
}

export function statusBadge(status: string) {
  const map: Record<string, Variant> = {
    active: 'green',
    completed: 'blue',
    defaulted: 'red',
    written_off: 'gray',
    draft: 'gray',
    submitted: 'yellow',
    approved: 'blue',
    disbursed: 'green',
    rejected: 'red',
    pending: 'yellow',
    paid: 'green',
    partial: 'orange',
    overdue: 'red',
    synced: 'green',
    'pending sync': 'yellow',
  };
  return map[status] ?? 'gray';
}

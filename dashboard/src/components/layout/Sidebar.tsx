'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import clsx from 'clsx';
import {
  LayoutDashboard, Users, Group, CreditCard, PiggyBank,
  BarChart3, LogOut, Building2, UserCog, Package,
} from 'lucide-react';
import { useAuth } from '@/contexts/AuthContext';
import { useRouter } from 'next/navigation';

const navItems = [
  { href: '/dashboard', label: 'Dashboard', icon: LayoutDashboard, roles: ['admin', 'branch_manager', 'field_officer', 'auditor'] },
  { href: '/clients', label: 'Clients', icon: Users, roles: ['admin', 'branch_manager', 'field_officer', 'auditor'] },
  { href: '/groups', label: 'Groups', icon: Group, roles: ['admin', 'branch_manager', 'field_officer', 'auditor'] },
  { href: '/loans', label: 'Loans', icon: CreditCard, roles: ['admin', 'branch_manager', 'field_officer', 'auditor'] },
  { href: '/savings', label: 'Savings', icon: PiggyBank, roles: ['admin', 'branch_manager', 'field_officer', 'auditor'] },
  { href: '/reports', label: 'Reports', icon: BarChart3, roles: ['admin', 'branch_manager', 'auditor'] },
  { href: '/loan-products', label: 'Loan Products', icon: Package, roles: ['admin'] },
  { href: '/branches', label: 'Branches', icon: Building2, roles: ['admin'] },
  { href: '/users', label: 'Users', icon: UserCog, roles: ['admin'] },
];

export function Sidebar() {
  const pathname = usePathname();
  const { user, logout } = useAuth();
  const router = useRouter();

  const visibleItems = navItems.filter(
    (item) => user && item.roles.includes(user.role),
  );

  async function handleLogout() {
    await logout();
    router.push('/login');
  }

  return (
    <aside className="w-60 flex-shrink-0 bg-slate-900 flex flex-col h-screen sticky top-0">
      {/* Logo */}
      <div className="px-5 py-5 border-b border-slate-800">
        <div className="flex items-center gap-2.5">
          <div className="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center flex-shrink-0">
            <Building2 className="w-4 h-4 text-white" />
          </div>
          <div className="min-w-0">
            <p className="text-sm font-bold text-white leading-none">MFI Admin</p>
            <p className="text-xs text-slate-400 mt-0.5 truncate">{user?.branch_name ?? 'All Branches'}</p>
          </div>
        </div>
      </div>

      {/* Nav */}
      <nav className="flex-1 px-3 py-4 space-y-0.5 overflow-y-auto">
        {visibleItems.map(({ href, label, icon: Icon }) => {
          const active = pathname === href || pathname.startsWith(`${href}/`);
          return (
            <Link
              key={href}
              href={href}
              className={clsx(
                'flex items-center gap-3 px-3 py-2 rounded-lg text-sm font-medium transition-colors',
                active
                  ? 'bg-blue-600 text-white'
                  : 'text-slate-400 hover:bg-slate-800 hover:text-white',
              )}
            >
              <Icon className="w-4 h-4 flex-shrink-0" />
              {label}
            </Link>
          );
        })}
      </nav>

      {/* User */}
      <div className="px-3 py-4 border-t border-slate-800 space-y-2">
        <div className="px-3 py-2">
          <p className="text-sm font-medium text-white truncate">{user?.full_name}</p>
          <p className="text-xs text-slate-400 capitalize">{user?.role?.replace('_', ' ')}</p>
        </div>
        <button
          onClick={handleLogout}
          className="flex items-center gap-3 w-full px-3 py-2 rounded-lg text-sm text-slate-400 hover:bg-slate-800 hover:text-white transition-colors"
        >
          <LogOut className="w-4 h-4" />
          Sign out
        </button>
      </div>
    </aside>
  );
}

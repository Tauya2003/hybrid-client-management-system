'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import clsx from 'clsx';
import {
  LayoutDashboard, Users, Group, CreditCard, PiggyBank,
  BarChart3, LogOut, Building2, UserCog, Package, Menu, X,
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

function NavLinks({ onNavigate }: { onNavigate?: () => void }) {
  const pathname = usePathname();
  const { user } = useAuth();
  const visibleItems = navItems.filter((item) => user && item.roles.includes(user.role));

  return (
    <nav className="flex-1 px-3 py-4 space-y-0.5 overflow-y-auto">
      {visibleItems.map(({ href, label, icon: Icon }) => {
        const active = pathname === href || pathname.startsWith(`${href}/`);
        return (
          <Link
            key={href}
            href={href}
            onClick={onNavigate}
            className={clsx(
              'flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors',
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
  );
}

export function Sidebar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const { user, logout } = useAuth();
  const router = useRouter();
  const pathname = usePathname();

  // Close drawer on route change
  useEffect(() => {
    setMobileOpen(false);
  }, [pathname]);

  // Lock body scroll while drawer is open
  useEffect(() => {
    document.body.style.overflow = mobileOpen ? 'hidden' : '';
    return () => { document.body.style.overflow = ''; };
  }, [mobileOpen]);

  async function handleLogout() {
    await logout();
    router.push('/login');
  }

  const userFooter = (
    <div className="px-3 py-4 border-t border-slate-800 space-y-1">
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
  );

  return (
    <>
      {/* ── Mobile top bar ────────────────────────────────────────────── */}
      <div className="lg:hidden fixed top-0 left-0 right-0 z-30 h-14 bg-slate-900 flex items-center px-4 gap-3 border-b border-slate-800">
        <button
          onClick={() => setMobileOpen(true)}
          className="text-slate-400 hover:text-white p-1 -ml-1"
          aria-label="Open navigation"
        >
          <Menu className="w-5 h-5" />
        </button>
        <div className="flex items-center gap-2 min-w-0">
          <div className="w-7 h-7 bg-blue-600 rounded-lg flex items-center justify-center flex-shrink-0">
            <Building2 className="w-3.5 h-3.5 text-white" />
          </div>
          <p className="text-sm font-bold text-white truncate">MFI Admin</p>
        </div>
        <p className="ml-auto text-xs text-slate-400 capitalize whitespace-nowrap">
          {user?.role?.replace('_', ' ')}
        </p>
      </div>

      {/* ── Mobile backdrop ───────────────────────────────────────────── */}
      {mobileOpen && (
        <div
          className="lg:hidden fixed inset-0 z-40 bg-black/60"
          onClick={() => setMobileOpen(false)}
        />
      )}

      {/* ── Mobile drawer ─────────────────────────────────────────────── */}
      <aside
        className={clsx(
          'lg:hidden fixed inset-y-0 left-0 z-50 w-64 bg-slate-900 flex flex-col',
          'transition-transform duration-300 ease-in-out',
          mobileOpen ? 'translate-x-0' : '-translate-x-full',
        )}
      >
        <div className="px-4 py-4 border-b border-slate-800 flex items-center justify-between">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center flex-shrink-0">
              <Building2 className="w-4 h-4 text-white" />
            </div>
            <div className="min-w-0">
              <p className="text-sm font-bold text-white leading-none">MFI Admin</p>
              <p className="text-xs text-slate-400 mt-0.5 truncate">{user?.branch_name ?? 'All Branches'}</p>
            </div>
          </div>
          <button
            onClick={() => setMobileOpen(false)}
            className="text-slate-400 hover:text-white p-1"
            aria-label="Close navigation"
          >
            <X className="w-5 h-5" />
          </button>
        </div>
        <NavLinks onNavigate={() => setMobileOpen(false)} />
        {userFooter}
      </aside>

      {/* ── Desktop sidebar (hidden below lg) ─────────────────────────── */}
      <aside className="hidden lg:flex w-60 flex-shrink-0 bg-slate-900 flex-col h-screen sticky top-0">
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
        <NavLinks />
        {userFooter}
      </aside>
    </>
  );
}

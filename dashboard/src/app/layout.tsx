import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import { AuthProvider } from '@/contexts/AuthContext';

const inter = Inter({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: 'MFI Admin Dashboard',
  description: 'Hybrid Cloud Offline Microfinance Management System',
  appleWebApp: {
    capable: true,
    title: 'MFI Admin Dashboard',
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <style>{`
          #initial-loader {
            position: fixed; inset: 0; z-index: 9999;
            display: flex; flex-direction: column;
            align-items: center; justify-content: center; gap: 16px;
            background: #f8fafc;
          }
          #initial-loader .spinner {
            width: 40px; height: 40px; border-radius: 50%;
            border: 3px solid #e2e8f0;
            border-top-color: #3b82f6;
            animation: spin 0.8s linear infinite;
          }
          #initial-loader .label {
            font-family: system-ui, sans-serif;
            font-size: 13px; color: #94a3b8; letter-spacing: 0.05em;
          }
          @keyframes spin { to { transform: rotate(360deg); } }
        `}</style>
      </head>
      <body className={`${inter.className} bg-slate-50 text-slate-900`}>
        <div id="initial-loader" aria-hidden="true">
          <div className="spinner" />
          <span className="label">Loading…</span>
        </div>
        <script
          dangerouslySetInnerHTML={{
            __html: `document.addEventListener('DOMContentLoaded',function(){var l=document.getElementById('initial-loader');if(l)l.style.display='none';});`,
          }}
        />
        <AuthProvider>{children}</AuthProvider>
      </body>
    </html>
  );
}

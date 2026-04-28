export default function Loading() {
  return (
    <div className="fixed inset-0 flex flex-col items-center justify-center gap-4 bg-slate-50">
      <div className="w-10 h-10 rounded-full border-[3px] border-slate-200 border-t-blue-500 animate-spin" />
      <span className="text-xs text-slate-400 tracking-wide">Loading…</span>
    </div>
  );
}

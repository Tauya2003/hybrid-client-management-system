#!/usr/bin/env bash
# =============================================================================
#  deploy.sh — HCMS Deployment Script
#  Usage:
#    ./deploy.sh           → deploy both backend AND dashboard
#    ./deploy.sh backend   → deploy backend only
#    ./deploy.sh dashboard → deploy dashboard only
# =============================================================================

set -euo pipefail

# ── Config ───────────────────────────────────────────────────────────────────
APP_DIR="/var/www/hybrid-client-management-system"
BACKEND_DIR="$APP_DIR/backend"
DASHBOARD_DIR="$APP_DIR/dashboard"
VENV="$BACKEND_DIR/venv/bin"

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
CYAN="\033[0;36m"
RESET="\033[0m"

# ── Helpers ───────────────────────────────────────────────────────────────────
log()     { echo -e "${CYAN}[$(date '+%H:%M:%S')] $*${RESET}"; }
success() { echo -e "${GREEN}✔  $*${RESET}"; }
warn()    { echo -e "${YELLOW}⚠  $*${RESET}"; }
error()   { echo -e "${RED}✘  $*${RESET}" >&2; exit 1; }

# ── Pull latest code ──────────────────────────────────────────────────────────
pull_code() {
    log "Pulling latest code from GitHub..."
    cd "$APP_DIR"
    git pull origin main
    success "Code updated"
}

# ── Backend deploy ────────────────────────────────────────────────────────────
deploy_backend() {
    log "Deploying backend..."

    cd "$BACKEND_DIR"

    # Install any new Python dependencies
    log "Installing Python dependencies..."
    "$VENV/pip" install -r requirements.txt --quiet
    success "Dependencies installed"

    # Run migrations
    log "Running database migrations..."
    "$VENV/python" manage.py migrate --noinput
    success "Migrations complete"

    # Collect static files (Django admin, DRF browsable API, etc.)
    log "Collecting static files..."
    "$VENV/python" manage.py collectstatic --noinput --clear
    success "Static files collected"

    # Restart backend process
    log "Restarting backend (PM2)..."
    pm2 restart hcms-backend
    success "Backend restarted"

    # Brief wait then show last log lines
    sleep 2
    echo ""
    warn "Last 15 backend log lines:"
    pm2 logs hcms-backend --lines 15 --nostream
}

# ── Dashboard deploy ──────────────────────────────────────────────────────────
deploy_dashboard() {
    log "Deploying dashboard..."

    cd "$DASHBOARD_DIR"

    # Install npm dependencies (respects package-lock.json)
    log "Installing Node dependencies..."
    npm ci --silent
    success "Node dependencies installed"

    # Build Next.js
    log "Building Next.js app (this may take a minute)..."
    npm run build
    success "Build complete"

    # Copy static assets into standalone output
    log "Copying static assets into standalone output..."
    rm -rf .next/standalone/.next/static
    rm -rf .next/standalone/public
    cp -r .next/static  .next/standalone/.next/static
    cp -r public        .next/standalone/public
    success "Static assets copied"

    # Restart dashboard process
    log "Restarting dashboard (PM2)..."
    pm2 restart hcms-dashboard
    success "Dashboard restarted"

    # Brief wait then show last log lines
    sleep 2
    echo ""
    warn "Last 15 dashboard log lines:"
    pm2 logs hcms-dashboard --lines 15 --nostream
}

# ── Nginx reload ──────────────────────────────────────────────────────────────
reload_nginx() {
    log "Testing and reloading Nginx..."
    sudo nginx -t && sudo systemctl reload nginx
    success "Nginx reloaded"
}

# ── Entry point ───────────────────────────────────────────────────────────────
TARGET="${1:-all}"
START_TIME=$(date +%s)

echo ""
echo -e "${CYAN}============================================${RESET}"
echo -e "${CYAN}  HCMS Deploy Script  —  target: ${TARGET}${RESET}"
echo -e "${CYAN}============================================${RESET}"
echo ""

case "$TARGET" in
    backend)
        pull_code
        deploy_backend
        ;;
    dashboard)
        pull_code
        deploy_dashboard
        reload_nginx
        ;;
    all|"")
        pull_code
        deploy_backend
        echo ""
        deploy_dashboard
        reload_nginx
        ;;
    *)
        error "Unknown target '$TARGET'. Use: backend | dashboard | (no arg for both)"
        ;;
esac

END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))

echo ""
echo -e "${GREEN}============================================${RESET}"
echo -e "${GREEN}  ✔  Deployment complete in ${ELAPSED}s${RESET}"
echo -e "${GREEN}============================================${RESET}"
echo ""

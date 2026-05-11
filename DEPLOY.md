# Deployment Guide

Targets:
- Backend API → `https://api.hcms.loficode.tech` (Django + Gunicorn + PM2)
- Dashboard   → `https://hcms.loficode.tech` (Next.js standalone + PM2)
- Database    → PostgreSQL 16 (native, on the same VPS)
- Reverse proxy → Nginx + Let's Encrypt SSL

---

## 1. DNS Setup (do this first)

In your domain registrar / DNS provider, add two A records pointing to your VPS IP:

| Type | Name                   | Value         |
|------|------------------------|---------------|
| A    | `hcms.loficode.tech`   | `<VPS_IP>`    |
| A    | `api.hcms.loficode.tech` | `<VPS_IP>` |

Wait for DNS to propagate before running Certbot (Step 6).

---

## 2. Server Provisioning (Ubuntu 22.04)

SSH into your VPS and run everything below as a non-root sudo user.

### Install system packages
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git nginx python3.12 python3.12-venv python3-pip \
    postgresql postgresql-contrib libpq-dev gcc curl
```

### Install Node.js 20
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

### Install PM2 globally
```bash
sudo npm install -g pm2
```

### Create the app directory
```bash
sudo mkdir -p /var/www/hcms
sudo chown $USER:$USER /var/www/hcms
```

---

## 3. PostgreSQL Setup

```bash
sudo -u postgres psql <<'SQL'
CREATE USER hcms_user WITH PASSWORD 'CHANGE-THIS-DB-PASSWORD';
CREATE DATABASE hcms_db OWNER hcms_user;
GRANT ALL PRIVILEGES ON DATABASE hcms_db TO hcms_user;
SQL
```

> Use the same password you'll put in `backend/.env`.

---

## 4. Deploy the Backend

### Clone / copy the code
```bash
cd /var/www/hcms
git clone https://github.com/YOUR_USERNAME/hybrid-client-management-system.git .
# OR use scp/rsync to copy from your local machine:
# rsync -avz --exclude='__pycache__' --exclude='.next' --exclude='node_modules' \
#   ./ user@<VPS_IP>:/var/www/hcms/
```

### Create Python virtualenv
```bash
cd /var/www/hcms/backend
python3.12 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

### Configure environment variables
```bash
cp .env.production .env
nano .env
```

Edit `.env` — set real values for:
- `SECRET_KEY` — generate one: `python -c "import secrets; print(secrets.token_urlsafe(50))"`
- `DB_PASSWORD` — must match what you set in Step 3
- Leave everything else as-is

### Run migrations and collect static files
```bash
source venv/bin/activate
python manage.py migrate
python manage.py collectstatic --noinput
python manage.py createsuperuser
```

### Test Gunicorn starts correctly
```bash
/var/www/hcms/backend/venv/bin/gunicorn config.wsgi:application \
    --bind 127.0.0.1:8000 --workers 1
# Press Ctrl+C when confirmed working
```

---

## 5. Deploy the Dashboard

### Install dependencies and build
```bash
cd /var/www/hcms/dashboard
npm ci
npm run build
```

> The build reads `.env.production` automatically. Confirm `NEXT_PUBLIC_API_URL=https://api.hcms.loficode.tech` is in that file before building.

### Copy static assets into the standalone directory
Next.js standalone mode does NOT bundle these automatically:
```bash
cp -r .next/static   .next/standalone/.next/static
cp -r public         .next/standalone/public
```

### Test the Node server starts
```bash
node .next/standalone/server.js
# Visit http://<VPS_IP>:3000 to confirm — then Ctrl+C
```

---

## 6. SSL Certificates (Certbot)

```bash
sudo apt install -y certbot python3-certbot-nginx

# Get certs for both domains in one command
sudo certbot --nginx \
    -d hcms.loficode.tech \
    -d api.hcms.loficode.tech \
    --non-interactive --agree-tos -m your@email.com
```

Certbot will automatically edit your Nginx config. You'll replace those auto-edits with the proper configs in the next step.

---

## 7. Nginx Configuration

```bash
# Copy the configs from the repo
sudo cp /var/www/hcms/nginx/api.hcms.loficode.tech \
        /etc/nginx/sites-available/api.hcms.loficode.tech

sudo cp /var/www/hcms/nginx/hcms.loficode.tech \
        /etc/nginx/sites-available/hcms.loficode.tech

# Enable both sites
sudo ln -s /etc/nginx/sites-available/api.hcms.loficode.tech \
           /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/hcms.loficode.tech \
           /etc/nginx/sites-enabled/

# Remove the default site if it exists
sudo rm -f /etc/nginx/sites-enabled/default

# Test and reload
sudo nginx -t
sudo systemctl reload nginx
```

---

## 8. Start Everything with PM2

Copy the ecosystem file to the server root and start:
```bash
cd /var/www/hcms
pm2 start ecosystem.config.js

# Check both processes are running
pm2 list
pm2 logs hcms-backend  --lines 20
pm2 logs hcms-dashboard --lines 20
```

### Save PM2 process list and enable startup on reboot
```bash
pm2 save
pm2 startup
# Run the command that pm2 prints (it will look like: sudo env PATH=... pm2 startup systemd ...)
```

---

## 9. Verify the Deployment

```bash
# Backend health check
curl https://api.hcms.loficode.tech/api/auth/login/ \
    -H "Content-Type: application/json" \
    -d '{"username":"admin","password":"yourpassword"}'
# Expect: {"access": "...", "refresh": "..."}

# Dashboard
curl -I https://hcms.loficode.tech
# Expect: HTTP/2 200
```

Open `https://hcms.loficode.tech` in a browser and log in.

---

## 10. Build the Production Mobile APK

On your **local development machine** (not the VPS):

```bash
cd mobile

# Release APK pointing at the production API
flutter build apk --release \
    --dart-define=API_BASE_URL=https://api.hcms.loficode.tech/api

# Output: build/app/outputs/flutter-apk/app-release.apk
```

Install on a physical device:
```bash
flutter install --release \
    --dart-define=API_BASE_URL=https://api.hcms.loficode.tech/api
```

> For development/emulator, run `flutter run` without `--dart-define` — it defaults to `http://10.0.2.2:8000/api`.

---

## PM2 Management Cheatsheet

```bash
pm2 list                        # show all processes
pm2 logs hcms-backend           # live logs for backend
pm2 logs hcms-dashboard         # live logs for dashboard
pm2 restart hcms-backend        # restart after code change
pm2 restart hcms-dashboard      # restart after code change
pm2 stop all                    # stop everything
pm2 monit                       # live CPU/memory dashboard
```

---

## Redeployment (after pushing code changes)

### Using the deploy script (recommended)

Copy `deploy.sh` to the server once, make it executable, then use it for every future update:

```bash
# First time only — copy script to server
scp deploy.sh user@<VPS_IP>:/var/www/hcms/deploy.sh
ssh user@<VPS_IP> "chmod +x /var/www/hcms/deploy.sh"
```

After that, every deployment is a single command:

```bash
# On your local machine — push code, then trigger deploy
git push origin main
ssh user@<VPS_IP> "/var/www/hcms/deploy.sh"            # deploy both
ssh user@<VPS_IP> "/var/www/hcms/deploy.sh backend"    # backend only
ssh user@<VPS_IP> "/var/www/hcms/deploy.sh dashboard"  # dashboard only
```

### Manual redeployment

### Backend update
```bash
cd /var/www/hcms
git pull origin main

cd backend
source venv/bin/activate
pip install -r requirements.txt        # only if requirements changed
python manage.py migrate               # only if there are new migrations
python manage.py collectstatic --noinput

pm2 restart hcms-backend
```

### Dashboard update
```bash
cd /var/www/hcms/dashboard
npm ci
npm run build
cp -r .next/static   .next/standalone/.next/static
cp -r public         .next/standalone/public

pm2 restart hcms-dashboard
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `502 Bad Gateway` | `pm2 list` — check if the process crashed; `pm2 logs` for errors |
| `CORS error` in browser | Confirm `CORS_ALLOWED_ORIGINS=https://hcms.loficode.tech` in backend `.env` and restart backend |
| Dashboard shows blank page | Check `pm2 logs hcms-dashboard`; confirm static files were copied in Step 5 |
| SSL certificate error | `sudo certbot renew --dry-run`; certs auto-renew via a cron job Certbot installs |
| Mobile `Connection refused` | Confirm device can reach `api.hcms.loficode.tech`; check Nginx is running: `sudo systemctl status nginx` |
| Database connection error | Check `.env` DB credentials match what you created in Step 3 |
| `gunicorn: command not found` | The ecosystem.config.js uses the full virtualenv path — confirm `/var/www/hcms/backend/venv/bin/gunicorn` exists |

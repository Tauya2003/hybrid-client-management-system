module.exports = {
  apps: [
    {
      name: 'hcms-backend',
      cwd: '/var/www/hybrid-client-management-system/backend',
      script: '/var/www/hybrid-client-management-system/backend/venv/bin/gunicorn',
      args: 'config.wsgi:application --bind 127.0.0.1:8000 --workers 3 --timeout 120 --access-logfile -',
      interpreter: 'none',
      env: {
        DJANGO_SETTINGS_MODULE: 'config.settings',
      },
    },
    {
      name: 'hcms-dashboard',
      cwd: '/var/www/hybrid-client-management-system/dashboard/.next/standalone',
      script: 'server.js',
      interpreter: 'node',
      env: {
        PORT: 3000,
        HOSTNAME: '127.0.0.1',
        NODE_ENV: 'production',
      },
    },
  ],
};

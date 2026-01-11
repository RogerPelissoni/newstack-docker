#!/bin/sh
set -e

echo "🚀 Entrypoint iniciado..."

echo "🔐 Garantindo permissões necessárias..."
mkdir -p vendor storage/logs storage/framework/cache/data bootstrap/cache
chown -R appuser:appgroup vendor storage bootstrap/cache || true

echo "📦 Instalando dependências PHP..."
su appuser -c "composer install --no-interaction --prefer-dist"

echo "🐘 Iniciando PHP-FPM..."
exec "$@"

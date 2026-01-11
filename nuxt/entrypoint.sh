#!/bin/sh
set -e

echo "🚀 Entrypoint Nuxt iniciado..."

echo "🔐 Garantindo permissões..."
mkdir -p node_modules .nuxt
chown -R node:node node_modules .nuxt || true

echo "📦 Instalando dependências PNPM..."
pnpm install

echo "🧩 Iniciando Nuxt..."
exec "$@"

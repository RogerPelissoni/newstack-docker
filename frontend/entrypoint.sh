#!/bin/sh
set -e

echo "🚀 Backend entrypoint iniciado"

echo "📦 Instalando dependências do backend (pnpm)"
pnpm install

exec "$@"
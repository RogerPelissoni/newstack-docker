#!/bin/sh
set -e

echo "🚀 Backend entrypoint iniciado"

echo "📦 Instalando dependências do backend (pnpm)"
pnpm install

echo "Gerando schema do Prisma"
pnpm prisma generate

exec "$@"
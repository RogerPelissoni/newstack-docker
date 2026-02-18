#!/bin/sh
set -e

echo "🚀 Backend entrypoint iniciado"

echo "📦 Instalando dependências do backend (pnpm)"
pnpm install

# echo "Gerando schema do Prisma"
# pnpm prisma generate

# echo "Executando migrations"
# pnpm prisma migrate dev
# pnpm prisma:seed

exec "$@"
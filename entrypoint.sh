#!/bin/bash

BASE_DIR="$HOME/dev"

REPOS=(
  "git@github.com:rogerpelissoni/saas-api.git"
  "git@github.com:rogerpelissoni/saas-nuxt.git"
  "git@github.com:rogerpelissoni/saas-docker.git"
)

echo "📁 Garantindo diretório $BASE_DIR"
mkdir -p "$BASE_DIR"

for REPO in "${REPOS[@]}"; do
  NAME=$(basename "$REPO" .git)
  TARGET_DIR="$BASE_DIR/$NAME"

  if [ -d "$TARGET_DIR" ]; then
    echo "⚠️  Repositório '$NAME' já existe, pulando clone..."
  else
    echo "⬇️  Clonando $NAME"
    git clone "$REPO" "$TARGET_DIR"
  fi
done

echo "📝 Configurando arquivos .env"

# saas-api
if [ -f "$BASE_DIR/saas-api/.env.docker.example" ] && [ ! -f "$BASE_DIR/saas-api/.env" ]; then
  cp "$BASE_DIR/saas-api/.env.docker.example" "$BASE_DIR/saas-api/.env"
  echo "✅ saas-api/.env criado"
else
  echo "⚠️  saas-api/.env já existe ou exemplo não encontrado"
fi

# saas-nuxt
if [ -f "$BASE_DIR/saas-nuxt/.env.docker.example" ] && [ ! -f "$BASE_DIR/saas-nuxt/.env" ]; then
  cp "$BASE_DIR/saas-nuxt/.env.docker.example" "$BASE_DIR/saas-nuxt/.env"
  echo "✅ saas-nuxt/.env criado"
else
  echo "⚠️  saas-nuxt/.env já existe ou exemplo não encontrado"
fi

echo "🚀 Ambiente pronto em $BASE_DIR"

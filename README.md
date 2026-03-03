# Newstack Docker Dev Environment

Ambiente de desenvolvimento local para:

- `nest-project` (API NestJS + Prisma)
- `next-project` (Frontend Next.js)
- `db` (MySQL 5.7)

Este repositório centraliza o `docker-compose` e as imagens de desenvolvimento para os dois projetos.

## 1) Estrutura esperada de pastas

O `docker-compose.yml` usa caminhos relativos. Mantenha esta estrutura:

```text
~/dev/
  newstack-docker/
  nest-project/
  next-project/
  newstack-database/
```

Sem essa estrutura, os `volumes` do compose não irão mapear corretamente.

## 2) Pré-requisitos

- Docker Engine + Docker Compose Plugin
- Git
- VS Code (opcional, para uso com Dev Containers)
- Extensão VS Code: `Dev Containers` (`ms-vscode-remote.remote-containers`)

## 3) Serviços e portas

Serviços definidos em `docker-compose.yml`:

- `db` (MySQL 5.7)
  - Porta: `3306`
  - Banco: `newstack`
  - Usuário root: `root`
  - Senha root: `admin`
- `backend` (NestJS)
  - Porta: `8000`
- `frontend` (Next.js)
  - Porta: `3000`

## 4) Fluxo A — Docker Compose (tradicional)

Subir ambiente:

```bash
cd ~/dev/newstack-docker
docker compose up -d --build
```

Ver logs:

```bash
docker compose logs -f backend
docker compose logs -f frontend
docker compose logs -f db
```

Parar ambiente:

```bash
docker compose down
```

## 5) Fluxo B — Dev Container (sem `docker compose up` manual)

Você não precisa rodar `docker compose up` manualmente se abrir pelo Dev Container.
O VS Code sobe os serviços automaticamente com base no `devcontainer.json`.

### 5.1 Nest project

- Arquivo: `~/dev/nest-project/.devcontainer/devcontainer.json`
- Serviço alvo: `backend`
- Serviços iniciados: `db`, `backend`

No VS Code:

1. Abra a pasta `nest-project`
2. Execute `Dev Containers: Rebuild and Reopen in Container`

### 5.2 Next project

- Arquivo: `~/dev/next-project/.devcontainer/devcontainer.json`
- Serviço alvo: `frontend`
- Serviços iniciados: `db`, `backend`, `frontend`

No VS Code:

1. Abra a pasta `next-project`
2. Execute `Dev Containers: Rebuild and Reopen in Container`

## 6) Controle de código fonte (Git) no container

As imagens de `backend` e `frontend` incluem:

- `git`
- `openssh-client`

Os Dev Containers foram configurados para encaminhar `SSH_AUTH_SOCK`, permitindo `git pull/push` via SSH dentro do container (usando as chaves do host).

Validar no terminal do container:

```bash
git --version
ssh -T git@github.com
```

## 7) Volumes e performance

### O que está mapeado

- Código-fonte:
  - `../nest-project:/app`
  - `../next-project:/app`
- Banco:
  - `../newstack-database:/var/lib/mysql`

### Impacto prático

- Em Linux, bind mount costuma ter bom desempenho.
- Em Mac/Windows, o custo de sincronização tende a ser maior.
- O volume de código é necessário para hot reload.
- O volume de banco mantém persistência de dados entre reinícios.

## 8) Comandos úteis

Rebuild de um serviço:

```bash
cd ~/dev/newstack-docker
docker compose build backend
docker compose build frontend
```

Entrar em shell de serviço:

```bash
docker compose exec backend sh
docker compose exec frontend sh
docker compose exec db sh
```

Limpeza geral (cuidado):

```bash
docker system prune -a --volumes
```

## 9) Troubleshooting rápido

### Porta em uso (`3000`, `3306`, `8000`)

- Pare processos locais conflitantes ou ajuste portas no compose.

### Dev Container não aparece no VS Code

- Confirme se abriu a pasta correta (`nest-project` ou `next-project`).
- Faça refresh no Explorer.
- Rode `Dev Containers: Rebuild and Reopen in Container`.

### Conflito de container name

Se já existir stack ativa com os mesmos nomes (`db`, `backend`, `frontend`), pare a stack antiga antes de abrir no Dev Container.

## 10) Quando usar Compose vs Dev Container

- Use **Compose direto** se busca fluxo simples e já está estável localmente.
- Use **Dev Container** se quer padronizar ambiente de editor/ferramentas entre máquinas e reduzir setup manual de onboarding.

Os dois fluxos são compatíveis e podem coexistir.
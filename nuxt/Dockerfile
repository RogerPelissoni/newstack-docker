FROM node:20-alpine

WORKDIR /app

# Instala pnpm globalmente
RUN npm install -g pnpm

EXPOSE 3000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["pnpm", "run", "dev", "--hostname", "0.0.0.0"]

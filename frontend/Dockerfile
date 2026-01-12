FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

EXPOSE 3000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["pnpm", "dev"]

# syntax=docker/dockerfile:1

# ---------- Estágio 1: build do Angular ----------
FROM node:22-alpine AS build
WORKDIR /app

# package*.json primeiro: o `npm ci` só reexecuta se as dependências mudarem.
COPY package.json package-lock.json ./
RUN npm ci

COPY . .
# Build de produção -> environment.prod.ts (apiUrl: '/api') -> dist/frontend/browser
RUN npm run build

# ---------- Estágio 2: nginx servindo os estáticos ----------
FROM nginx:stable-alpine

# A imagem do nginx aplica envsubst em /etc/nginx/templates/*.template ao iniciar
# e grava o resultado em /etc/nginx/conf.d/. Assim o destino da API vem de variável.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /app/dist/frontend/browser /usr/share/nginx/html

# Valor padrão (nome do serviço no Compose); sobrescreva com -e BACKEND_URL=...
ENV BACKEND_URL=http://api:8080

EXPOSE 80

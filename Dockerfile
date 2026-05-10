# Etapa 1: Construcción
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Producción
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Seguridad: Usuario no root
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /usr/share/nginx/html /var/cache/nginx /var/log/nginx /etc/nginx/conf.d
USER nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
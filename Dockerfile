# Stage 1: build Angular app
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install -g @angular/cli
RUN npm install -g ts-node typescript
RUN npm install
COPY . .
RUN npm run build -- --configuration development

# Stage 2: serve with Nginx
FROM nginx:alpine

# Remove default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy built Angular app
COPY --from=builder /app/dist/ui/browser/ /usr/share/nginx/html/

# Copy custom Nginx config (optional, for SPA routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

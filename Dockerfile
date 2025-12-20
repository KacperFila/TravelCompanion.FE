# Stage 1: Build Angular app
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG CONFIGURATION=local
ENV CONFIGURATION=${CONFIGURATION:-local}

RUN echo "Building Angular app with configuration: $CONFIGURATION" \
    && npm run build -- --configuration $CONFIGURATION

# Stage 2: Serve with Nginx
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist/ui/browser/ /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

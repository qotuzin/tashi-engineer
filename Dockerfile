# Stage 1: build the static site with Zola
FROM ghcr.io/getzola/zola:v0.22.1 AS builder

WORKDIR /app
COPY . .
RUN ["zola", "build"]

# Stage 2: serve with nginx
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

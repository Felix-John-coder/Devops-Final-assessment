FROM nginx:1.27-alpine

# Copy source code
RUN rm -rf /usr/share/nginx/html/*
COPY ./ /usr/share/nginx/html

RUN apk update && apk upgrade --no-cache
# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf 

# Create a non-root user and grant access to required files
RUN chown -R nginx:nginx /usr/share/nginx/html \
    /var/cache/nginx \
    /var/log/nginx \
    /etc/nginx \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

# Run Nginx as a non-root user in nomand
USER nginx

EXPOSE 8080

# alpine-slim is the absolute smallest Nginx image available
FROM nginx:alpine-slim

# Strip out unnecessary default files to save disk space
RUN rm /etc/nginx/conf.d/default.conf && \
    rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

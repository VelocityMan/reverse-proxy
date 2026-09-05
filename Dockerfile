# Use the 'alpine-slim' version for the absolute smallest possible disk footprint
FROM nginx:alpine-slim

# Remove default config so it doesn't conflict with yours
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

# Explicitly tell Nginx to stay in the foreground (required for Render to track the app)
CMD ["nginx", "-g", "daemon off;"]

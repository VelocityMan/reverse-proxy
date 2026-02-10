FROM caddy:2-alpine

# Create a non-root user
RUN addgroup -S caddygroup && adduser -S caddyuser -G caddygroup

# Copy config
COPY Caddyfile /etc/caddy/Caddyfile

# Fix permissions
RUN chown -R caddyuser:caddygroup /etc/caddy

# Switch to non-root user
USER caddyuser

# Run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

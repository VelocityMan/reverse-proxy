FROM caddy:2-builder AS builder

FROM caddy:2
COPY Caddyfile /etc/caddy/Caddyfile

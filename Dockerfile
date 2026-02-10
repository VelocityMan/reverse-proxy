FROM alpine:latest

WORKDIR /app

COPY ngrix /app/ngrix
RUN chmod +x /app/ngrix

COPY ngrix.conf /app/ngrix.conf

EXPOSE 80

CMD ["/app/ngrix", "server", "--config", "/app/ngrix.conf"]

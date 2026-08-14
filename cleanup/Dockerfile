FROM debian:bookworm-slim

#Instalamos cron
RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

#Copiamos nuestro script
COPY cleanup.sh /usr/local/bin/cleanup.sh
#Copiamos la configuración de cron
COPY cleanup-cron /etc/cron.d/cleanup-cron

#damos los permisos
RUN chmod +x /usr/local/bin/cleanup.sh \
    && chmod 0644 /etc/cron.d/cleanup-cron

CMD ["cron", "-f"]
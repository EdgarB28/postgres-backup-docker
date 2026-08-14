FROM postgres:16

#Instalamos cron
RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

#Copiamos nuestro script
COPY backup.sh /usr/local/bin/backup.sh
#Copiamos la configuración de cron
COPY backup-cron /etc/cron.d/backup-cron

#damos los permisos
RUN chmod +x /usr/local/bin/backup.sh \
    && chmod 0644 /etc/cron.d/backup-cron \
    && crontab /etc/cron.d/backup-cron

#ejecutamos
CMD ["cron", "-f"]
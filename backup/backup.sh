#!/bin/bash

#Fecha
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="/backups/backup_${TIMESTAMP}.sql"

echo "Iniciando backup: ${BACKUP_FILE}"

#ejecucion del backup de postgress
PGPASSWORD="${POSTGRES_PASSWORD}" pg_dump \
    -h postgres \
    -U "${POSTGRES_USER}" \
    -d escuela \
    > "${BACKUP_FILE}"

if [ $? -eq 0 ]; then
    echo "Backup creado correctamente: ${BACKUP_FILE}"
else
    echo "ERROR: No se pudo crear el backup"
    rm -f "${BACKUP_FILE}"
    exit 1
fi
#!/bin/bash

#Busca los backups
BACKUP_DIR="/backups"

echo "Iniciando limpieza de backups..."

#Obtiene los Backups y los ordena por fecha de creacion
BACKUPS=$(find "$BACKUP_DIR" -maxdepth 1 -type f -name "backup_*.sql" -printf "%T@ %p\n" | sort -nr)

COUNT=$(echo "$BACKUPS" | grep -c . || true)

if [ "$COUNT" -le 1 ]; then
    echo "No hay backups suficientes para realizar limpieza."
    exit 0
fi

echo "$BACKUPS" | tail -n +2 | cut -d' ' -f2- | while read -r FILE; do
    echo "Eliminando: $FILE"
    rm -f "$FILE"
done

echo "Limpieza completada."
#!/bin/bash

BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="${BACKUP_DIR}/backup_${TIMESTAMP}.sql"

if [ ! -d "$BACKUP_DIR" ]; then
    sudo mkdir -p "$BACKUP_DIR"
fi


docker run --rm \
  --env-file /opt/shvirtd-example-python/.env \
  --network shvirtd-example-python_backend \
  schnitzler/mysqldump \
  sh -c 'exec mysqldump --host="db" --user="${MYSQL_USER}" --password="${MYSQL_PASSWORD}" --databases "${MYSQL_DATABASE}"' > "${BACKUP_FILENAME}"


#!/bin/bash

SOURCE_DIR="/home/kunal/Desktop/linux/shared"

BACKUP_DIR="/home/kunal/Desktop/linux/backup"
LOG_FILE="${BACKUP_DIR}/backup_cron.log"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

BACKUP_FILE="backup_${DATE}.tar.gz"

tar -czf "${BACKUP_DIR}/${BACKUP_FILE}" "${SOURCE_DIR}"

if [ $? -eq 0 ]; then
	 echo "✅ Backup successful: ${BACKUP_DIR}/${BACKUP_FILE}"
else
    echo "❌ Backup failed at $(date)"
    exit 1
fi
echo "main branch added feature"

echo "11 echo 'Backup started at $(date)'"


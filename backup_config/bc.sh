#!/bin/bash

# змінна з шляхом до каталогу з бекапами
BACKUP_DIR="/dir/backup"

# створення директорії для бекапу
mkdir -p "$BACKUP_DIR"

# бекап ключів GPG
echo "Створення бекапу ключів GPG..."
gpg --export > "$BACKUP_DIR/gpg-keys.pub"
gpg --export-secret-keys > "$BACKUP_DIR/gpg-keys.secret"

# копіювання файлів для UFW та SSH
echo "Копіювання файлів для UFW та SSH..."
cp /etc/ssh/sshd_config "$BACKUP_DIR/ssh"
cp /etc/ufw/user.rules "$BACKUP_DIR/ufw"

# копіювання файлів для Samba та NFS
echo "Копіювання файлів для Samba та NFS..."
cp /etc/fstab "$BACKUP_DIR/fstab"
cp /etc/samba/smb.conf "$BACKUP_DIR/samba"
cp /etc/exports "$BACKUP_DIR/exports"

# повідомлення про завершення бекапу
echo "Бекап завершено."

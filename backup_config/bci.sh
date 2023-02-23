#!/bin/bash

# шлях до каталогу з бекапами
BACKUP_DIR="/dir/backup"

# відновлення файлу fstab
echo "Відновлення файлу fstab..."
cp "$BACKUP_DIR/fstab" /etc

# відновлення файлів для Samba та NFS
echo "Відновлення файлів для Samba та NFS..."
cp "$BACKUP_DIR/samba.conf" /etc/samba
cp "$BACKUP_DIR/exports" /etc/exports

# відновлення файлів для UFW та SSH
echo "Відновлення файлів для UFW та SSH..."
cp "$BACKUP_DIR/ufw" /etc/ufw
cp "$BACKUP_DIR/sshd_config" /etc/ssh

# відновлення ключів GPG
echo "Відновлення ключів GPG..."
gpg --import "$BACKUP_DIR/gpg-keys.pub" "$BACKUP_DIR/gpg-keys.secret"

# повідомлення про завершення відновлення
echo "Відновлення завершено."


#!/bin/bash

# Шлях до каталогу, в який буде розпаковано розшифрований архів
dir_path="dir/decrypt"

# Назва зашифрованого файлу
encrypted_file="encrypted.tar.gz.gpg"

# id gpg ключа
key_id="gpg"

# Об'єднуємо всі частини зашифрованого файлу
cat "$encrypted_file.part."* > "$encrypted_file"

# Розшифровуємо зашифрований файл за допомогою gpg ключа
gpg --output "$encrypted_file.tar.gz" --decrypt "$encrypted_file"

# Розпаковуємо архів
tar -xzf "$encrypted_file.tar.gz" -C "$dir_path"

# Видаляємо тимчасові файли
rm "$encrypted_file" "$encrypted_file.part."* "$encrypted_file.tar.gz"

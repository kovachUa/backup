#!/bin/bash

# Шлях до каталогу, який потрібно зашифрувати
dir_path="dir/encrypt"

# Назва файлу, в який буде збережено зашифрований каталог
encrypted_file="encrypted.tar.gz.gpg"

# id gpg ключа
key_id="gpg"

# Стискаємо вміст каталогу та архівуємо його
tar -czf "$dir_path.tar.gz" "$dir_path"

# Шифруємо архів за допомогою gpg ключа
gpg --output "$encrypted_file" --encrypt --recipient "$key_id" "$dir_path.tar.gz"

# Розділяємо зашифрований файл на частини по 100 МБ
split -b 100M "$encrypted_file" "$encrypted_file.part."

# Видаляємо тимчасові файли
rm "$dir_path.tar.gz" "$encrypted_file"

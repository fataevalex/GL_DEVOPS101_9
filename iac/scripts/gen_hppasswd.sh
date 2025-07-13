#!/bin/bash

# Проверяем, был ли передан аргумент (пароль)
if [ -z "$1" ]; then
  echo "Использование: $0 <пароль>"
  echo "Пример: $0 mysecretpassword"
  exit 1
fi

PASSWORD="$1"
USERNAME="admin" # Вы можете изменить имя пользователя здесь, если нужно

# Генерируем случайную 8-символьную соль для OpenSSL
SALT=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8)

# Генерируем хеш в формате APR1-MD5, совместимом с htpasswd
# и выводим его в формате "логин:хеш"
echo "${USERNAME}:$(openssl passwd -stdin -apr1 -salt "$SALT" <<< "$PASSWORD")"


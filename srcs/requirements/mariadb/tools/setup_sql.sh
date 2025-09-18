#!/bin/bash
set -e

service mariadb start

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
  echo "[init] Setting up database and users..."
  mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
else
  echo "[init] Database '${MYSQL_DATABASE}' already exists, skipping init."
fi


kill "$(cat /var/run/mysqld/mysqld.pid)"

exec "$@"

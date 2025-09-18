#!/bin/bash
set -e

[ -f ./index.html ] && rm ./index.html


if [ ! -f wp-settings.php ]; then
  echo "Downloading WordPress..."
  wget -q https://wordpress.org/latest.zip -O /tmp/wordpress.zip
  unzip -q /tmp/wordpress.zip -d /tmp
  mv /tmp/wordpress/* .
  rm -rf /tmp/wordpress /tmp/wordpress.zip
else
  echo "WordPress already installed."
fi


if [ ! -f wp-config.php ]; then
  echo "Creating wp-config.php..."
  wp-cli config create \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb-inception \
    --allow-root

  echo "Installing WordPress..."
  wp-cli core install \
    --url=$WORDPRESS_URL \
    --title="$WORDPRESS_TITLE" \
    --admin_user=$WORDPRESS_ADMIN_USER \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL \
    --skip-email \
    --allow-root

  echo "Creating extra user..."
  wp-cli user create \
    "$WORDPRESS_EXTRA_USER" \
    "$WORDPRESS_EXTRA_USER_EMAIL" \
    --user_pass="$WORDPRESS_EXTRA_USER_PASSWORD" \
    --role=editor \
    --allow-root
fi

chown -R www-data:www-data /var/www/html

exec "$@"

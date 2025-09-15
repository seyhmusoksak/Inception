#!/bin/bash

[ -f ./index.html ] && rm ./index.html

if [ ! -x /usr/local/bin/wp-cli ]; then
  echo "Downloading wp-cli..."
  wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp-cli
  chmod +x /usr/local/bin/wp-cli
fi

if [ ! -f wp-settings.php ]; then
  echo "Downloading WordPress..."
  wget -q https://wordpress.org/latest.zip -O /tmp/wordpress.zip
  unzip -q /tmp/wordpress.zip -d /tmp
  mv /tmp/wordpress/* .
  rm -rf /tmp/wordpress /tmp/wordpress.zip
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
    --role=editor \
    --allow-root
fi

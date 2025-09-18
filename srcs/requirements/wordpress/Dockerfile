FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y \
	php8.2 \
	php8.2-cli \
	php8.2-mbstring \
	php8.2-xml \
	php8.2-zip \
	php8.2-gd \
	php8.2-fpm \
	php8.2-mysql \
	php8.2-cgi \
	wget \
	unzip \
	curl

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY tools/create_wordpress.sh /usr/local/bin/

RUN curl -s -o /usr/local/bin/wp-cli https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp-cli \
	&& chown www-data:www-data /usr/local/bin/wp-cli

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

RUN chmod +x /usr/local/bin/create_wordpress.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

CMD ["php-fpm8.2", "-F"]

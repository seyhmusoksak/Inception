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
	unzip

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY tools/create_wordpress.sh /usr/local/bin/

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN chmod +x /usr/local/bin/create_wordpress.sh

EXPOSE 9000

CMD ["bash", "-c", "/usr/local/bin/create_wordpress.sh && php-fpm8.2 -F"]

FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y \
	openssl \
	nginx

RUN mkdir -p /etc/nginx/ssl

COPY tools/create_ssl.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/create_ssl.sh

RUN /usr/local/bin/create_ssl.sh

CMD ["nginx", "-g", "daemon off;"]

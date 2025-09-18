FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY conf/edited.cnf /etc/mysql/mariadb.conf.d/

COPY tools/setup_sql.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup_sql.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/setup_sql.sh"]

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]

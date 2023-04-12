FROM alpine:3.16.4

RUN apk update && apk add --no-cache \
    mariadb \
    mariadb-client

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf.d/my.cnf

EXPOSE 3306

STOPSIGNAL SIGQUIT

COPY tools/entrypoint.sh /tmp/entrypoint.sh
CMD ["sh", "/tmp/entrypoint.sh"]

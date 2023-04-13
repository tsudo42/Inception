FROM alpine:3.16.4

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./conf/my.cnf /etc/my.cnf.d/my.cnf

COPY --chmod=755 tools/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

CMD ["mariadbd", "--user=mysql"]

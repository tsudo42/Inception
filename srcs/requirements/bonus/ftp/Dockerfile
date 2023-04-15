FROM alpine:3.16.4

RUN apk update && apk upgrade && \
    apk add --no-cache \
    pure-ftpd \
    openssl \
    rsyslog

RUN mkdir -p /var/log/pure-ftpd

COPY ./conf/rsyslog.conf /etc/rsyslog.conf

COPY --chmod=755 tools/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 20 21 30000-30009

CMD ["pure-ftpd", "-l", "puredb:/etc/pureftpd.pdb", "-E", "-j", "-R", "-P", "localhost", "-p", "30000:30009", "-c", "5", "-C", "5", "-Y", "1"]

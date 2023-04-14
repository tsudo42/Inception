FROM alpine:3.16.4

RUN apk update && apk upgrade && \
    apk add --no-cache redis && \
    mkdir -p /etc/redis && \
    chown -R redis:redis /etc/redis

COPY ./conf/redis.conf /etc/redis/redis.conf

COPY --chmod=755 tools/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

USER redis

STOPSIGNAL SIGQUIT

CMD ["redis-server", "/etc/redis/redis.conf"]

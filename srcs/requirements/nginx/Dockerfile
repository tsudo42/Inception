FROM alpine:3.16.4

RUN apk update && apk upgrade && apk add --no-cache \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -new -x509 \
    -sha256 -newkey rsa:2048 -days 365 -nodes \
    -subj /CN=${DOMAIN_NAME} \
    -out /etc/nginx/ssl/nginx.pem \
    -keyout /etc/nginx/ssl/nginx.key && \
    chown root:root -R /etc/nginx/ssl && \
    chmod 600 /etc/nginx/ssl/* && \
    chmod 700 /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d /etc/nginx/conf.d

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY --chmod=755 tools/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

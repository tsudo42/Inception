FROM alpine:3.16.4

RUN addgroup -S ngircd; \
    adduser -S -D -h /sbin/nologin -H -G ngircd ngircd

RUN apk update && apk upgrade && \
    apk add --no-cache \
    ngircd \
    ngircd-doc

COPY conf/ /etc/ngircd/

EXPOSE 6667

STOPSIGNAL SIGTERM

CMD ["ngircd", "-n"]

FROM alpine:edge

LABEL MAINTAINER="vld.x@hotmail.com"

ARG WEBPROC_VERSION=0.4.0

ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/v$WEBPROC_VERSION/webproc_${WEBPROC_VERSION}_linux_amd64.gz

RUN apk update \
        && apk --no-cache add dnsmasq \
        && apk add --no-cache --virtual .build-deps curl \
        && curl -sL $WEBPROC_URL | gzip -d - > /usr/local/bin/webproc \
        && chmod +x /usr/local/bin/webproc \
        && apk del .build-deps

RUN mkdir -p /etc/default/

RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf

ENTRYPOINT ["webproc", "--configuration-file", "/etc/dnsmasq.conf", "--", "dnsmasq", "--keep-in-foreground", "--log-facility=/dev/stdout"]

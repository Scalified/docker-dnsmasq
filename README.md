# DNSMASQ

[![Build Status](https://github.com/Scalified/docker-dnsmasq/actions/workflows/docker-image.yml/badge.svg)](https://github.com/Scalified/docker-dnsmasq/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/dnsmasq.svg)](https://hub.docker.com/r/scalified/dnsmasq)

## Description

A lightweight DNSMASQ Service running on [Alpine Linux](https://www.alpinelinux.org) and managed by [webproc](https://github.com/jpillora/webproc) web UI

## How-To

### Run

```cmd
docker run \
  --name dnsmasq \
  -v dnsmasq.conf:/etc/dnsmasq.conf \
  --log-opt "max-size=100m" \
  -e "HTTP_USER=<username>" \
  -e "HTTP_PASS=<password>" \
  -d \
  --restart always \
  scalified/dnsmasq
```

## Scalified Links

* [Scalified](https://www.scalified.com)
* [Scalified Official Facebook Page](https://www.facebook.com/scalified)
* <a href="mailto:info@scalified.com?subject=[Rancher Cloudflare]: Proposals And Suggestions">Scalified Support</a>

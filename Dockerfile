ARG TAG=20.0.2
# hadolint ignore=DL3006
FROM nextcloud:${TAG}

LABEL maintainer="info@thorstenreichelt.de"

ARG DEBIAN_FRONTEND=noninteractive
ARG LOCALES_VERSION="2.28-10" 
ARG TZDATA_VERSION="2020d-0+deb10u1" 
ARG NANO_VERSION="3.2-3"
ARG CURL_VERSION="7.64.0-4+deb10u1"

RUN apt-get update -qq && apt-get install -y  --no-install-recommends\
	locales=${LOCALES_VERSION} \      
	tzdata=${TZDATA_VERSION} \
	nano=${NANO_VERSION} \
	curl=${CURL_VERSION} \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
	&& \dpkg-reconfigure --frontend=noninteractive locales \
	&& \update-locale LANG=de_DE.UTF-8 \
	&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ENV LANG="de_DE.UTF-8" \
    LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

HEALTHCHECK --interval=1m --timeout=5s --retries=3 CMD curl -f http://localhost/ || exit 1

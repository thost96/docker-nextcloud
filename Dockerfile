ARG TAG=20.0.4

FROM nextcloud:${TAG}

LABEL maintainer="info@thorstenreichelt.de"

ARG DEBIAN_FRONTEND="noninteractive"

ENV LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
	locales=2.28-10 \      
	tzdata=2020d-0+deb10u1 \
	nano=3.2-3 \
	curl=7.64.0-4+deb10u1 \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
	&& \dpkg-reconfigure --frontend=noninteractive locales \
	&& \update-locale LANG=de_DE.UTF-8 \
	&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

HEALTHCHECK --interval=1m --timeout=5s --retries=3 CMD curl -f http://localhost/ || exit 1
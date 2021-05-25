ARG TAG=21.0.2

FROM nextcloud:${TAG}

LABEL maintainer="info@thorstenreichelt.de"

ARG DEBIAN_FRONTEND="noninteractive"

ENV LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

# hadolint ignore=DL3008
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
	locales \      
	tzdata \
	curl \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
	&& \dpkg-reconfigure --frontend=noninteractive locales \
	&& \update-locale LANG=de_DE.UTF-8 \
	&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

HEALTHCHECK --interval=1m --timeout=5s --retries=3 CMD curl -f http://localhost/ || exit 1
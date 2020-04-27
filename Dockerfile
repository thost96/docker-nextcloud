FROM nextcloud:18.0.4

LABEL maintainer="info@thorstenreichelt.de"

RUN apt-get update -qq && apt-get install -y -qq \
        locales \
	tzdata \
	sudo \
	nano \
     && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
    && \dpkg-reconfigure --frontend=noninteractive locales \
    && \update-locale LANG=de_DE.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ENV LANG="de_DE.UTF-8" \
	TZ="Europe/Berlin"



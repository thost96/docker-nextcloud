# docker-nextcloud
Nextcloud with Add-ons as Docker Container

![Docker Image CI](https://github.com/thost96/docker-nextcloud/workflows/Docker%20Image%20CI/badge.svg)
![Lint Code Base](https://github.com/thost96/docker-nextcloud/workflows/Lint%20Code%20Base/badge.svg)

## Docker RUN

    docker run \
      --name nextcloud \
      --hostname nextcloud \
      --restart always \      
      -e 'TZ=Europe/Berlin' \
      --volume 'nextcloud:/var/www/html' \
      thost96/nextcloud:latest

## Docker Compose

    version: '2'
    services:
        nextcloud:
            container_name: nextcloud
            hostname: nextcloud        
            restart: always
            environment:
                - TZ=Europe/Berlin
            volumes:
                - 'nextcloud:/var/www/html'
            image: 'thost96/nextcloud:latest'


## Changelog

## 1.6.1 (pending)
* (thost96) - removed security checks from Docker Image CI Action into own Security Check Action
* (thost96) - updated tzdata to 2020d-0+deb10u1

### 1.6.0 (27.08.2020)
* (thost96) - changed Readme to global changelog version
* (thost96) - added github actions for automated builds
* (thost96) - modified dockerfile to get github actions working

### 1.5.0 (17.07.2020)
* (thost96) - updated to nextcloud:19.0.1

### 1.4.0 (09.06.2020)
* (thost96) - setting dockerfile from nextcloud:19.0.0 to nextcloud:18.0.5 and 18.0.6 for building this images as well
* (thost96) - added Dependabot config

### 1.3.0 (08.06.2020)
* (thost96) - added healthcheck using curl
* (thost96) - updated nextcloud:19.0.0 and removed nextcloud:19.0.0-beta

### 1.2.2 (16.05.2020)
* (thost96) - pinned packages locales, tzdata and nano to fixed versions

### 1.2.1 (15.05.2020)
* (thost96) - removed sudo from image

### 1.2.0 (27.04.2020)
* (thost96) - fixed failing builds and added nextcloud:19.0.0-beta

### 1.1.0 (24.04.2020)
* (thost96) - changed base image from nextcloud:latest to nextcloud:18.0.4 to get exact pinning
* (thost96) - removed mariadb-client from image

### 1.0.0 (02.03.2020)
* (thost96) - initial release
* (thost96) - added timezone and locales to dockerfile

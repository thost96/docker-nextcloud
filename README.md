# docker-nextcloud
Nextcloud with Add-ons as Docker Container

![Docker Image CI](https://github.com/thost96/docker-nextcloud/workflows/Docker%20Image%20CI/badge.svg)
![Lint Code Base](https://github.com/thost96/docker-nextcloud/workflows/Lint%20Code%20Base/badge.svg)

## Docker Run

    docker run \
      --name nextcloud \
      --hostname nextcloud \
      --restart always \      
      --volume 'nextcloud:/var/www/html' \
      thost96/nextcloud:latest

## Docker Compose

    version: '2'
    services:
        nextcloud:
            container_name: nextcloud
            hostname: nextcloud     
            restart: always
            volumes:
                - 'nextcloud:/var/www/html'
            image: 'thost96/nextcloud:latest'

## Docker Stack 

    version: '3'
    services:
        nextcloud:
            volumes:
                - 'nextcloud:/var/www/html'
            image: 'thost96/nextcloud:latest'
            deploy:
                update_config:
                    order: start-first
                    failure_action: rollback
                    delay: 10s
                rollback_config:
                    parallelism: 0
                    order: stop-first
                restart_policy:
                    condition: any
                    delay: 5s
                    max_attempts: 3

## Changelog

### 1.8.4 (12.04.2021)
* (thost96) - added version 20.0.9 and 21.0.1
* (thost96) - added Docker Stack config

### 1.8.3 (02.03.2021)
* (thost96) - added version 20.0.8

### 1.8.2 (22.02.2021)
* (thost96) - added version 21.0.0

### 1.8.1 (16.02.2021)
* (thost96) - added version 20.0.7
* (thost96) - removed nano from image

### 1.8.0 (29.01.2021)
* (thost96) - added version 20.0.5 and 20.0.6

### 1.7.0 (17.01.2021)
* (thost96) - removed security checks from Docker Image CI Action into own Security Check Action
* (thost96) - updated tzdata to 2020d-0+deb10u1
* (thost96) - simplified image building and changed to global standards

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
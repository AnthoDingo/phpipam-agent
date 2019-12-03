FROM php:7.1.9-cli
LABEL maintainer="me@janus.ovh"

ENV DEBIAN_FRONTEND=noninteractive TERM=linux TZ=Europe/Paris
ENV SCAN_INTERVAL=1h AGENT_KEY='' API_KEY=''

RUN apt update && \
    apt install -y --no-install-recommends fping git cron php-pear ca-certificates supervisor vim && \
    apt install -y --no-install-recommends libgmp-dev re2c libmhash-dev libmcrypt-dev file && \
    docker-php-ext-install pdo pdo_mysql mbstring iconv ctype gettext gmp json pcntl && \
    git clone  --recursive https://github.com/AnthoDingo/phpipam-agent.git /phpipam

ADD root /
RUN  chmod  750 /entrypoint.sh

WORKDIR /phpipam
CMD ['/entrypoint.sh']
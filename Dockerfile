FROM php:stretch
LABEL maintainer="me@janus.ovh"

ENV SCAN_INTERVAL=1h AGENT_KEY='' API_KEY=''

ADD root/entrypoint.sh /entrypoint.sh
RUN apt update && \
    apt install -y --no-install-recommends fping git cron && \
    git clone  --recursive https://github.com/AnthoDingo/phpipam-agent.git /phpipam && \
    touch /var/log/cron.log && \
    chmod  750 /entrypoint.sh

CMD /entrypoint.sh
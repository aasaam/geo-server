FROM python:3.9-slim

ADD geo-server/ /

RUN export DEBIAN_FRONTEND=noninteractive ; \
  apt update \
  && apt upgrade -y \
  && apt install build-essential ca-certificates libfreetype6-dev libgdal-dev libgeos-dev libjpeg-dev zlib1g-dev --no-install-recommends -y \
  && cd /tmp \
  && python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install --no-cache-dir --upgrade Pillow PyYAML lxml Shapely waitress \
  && python3 -m pip install --no-cache-dir --upgrade MapProxy \
  && apt remove build-essential  -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && cd / \
  && chmod +x /geo-server/entrypoint.sh \
  && rm -rf /root/.cache && rm -r /var/lib/apt/lists/* && rm -rf /tmp && mkdir /tmp && chmod 777 /tmp && truncate -s 0 /var/log/*.log

WORKDIR /

ENV LISTEN_HOST 127.0.0.1
ENV LISTEN_PORT 48080

ENTRYPOINT [ "/geo-server/entrypoint.sh" ]

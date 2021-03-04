# Copyright (c) 2021 aasaam software development group
FROM python:buster

LABEL org.label-schema.name="geo-server" \
      org.label-schema.description="geo-server" \
      org.label-schema.url=https://github.com/aasaam/geo-server \
      org.label-schema.vendor="aasaam" \
      maintainer="Muhammad Hussein Fattahizadeh <m@mhf.ir>"

ADD config.py /config.py
ADD mapproxy.yaml /mapproxy.yaml
ADD entrypoint.sh /entrypoint.sh

RUN export DEBIAN_FRONTEND=noninteractive ; \
  apt update \
  && apt upgrade -y \
  && apt install libproj13 libgeos-dev libgdal-dev --no-install-recommends -y \
  && cd /tmp \
  && python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install --no-cache-dir --upgrade Pillow PyYAML lxml Shapely waitress \
  && python3 -m pip install --no-cache-dir --upgrade https://github.com/mapproxy/mapproxy/tarball/master \
  && apt-get autoremove -y \
  && apt-get clean \
  && cd / \
  && chmod +x /entrypoint.sh \
  && rm -rf /root/.cache && rm -r /var/lib/apt/lists/* && rm -rf /tmp && mkdir /tmp && chmod 777 /tmp && truncate -s 0 /var/log/*.log

WORKDIR /

ENV LISTEN_HOST 127.0.0.1
ENV LISTEN_PORT 48080
ENV HTTP_PROXY ""

ENTRYPOINT [ "/entrypoint.sh" ]

FROM tomcat:10-jdk8

LABEL org.label-schema.name="geo-server" \
      org.label-schema.description="geo-server" \
      org.label-schema.url=https://github.com/aasaam/geo-server \
      org.label-schema.vendor="aasaam" \
      maintainer="Muhammad Hussein Fattahizadeh <m@mhf.ir>"

ARG GEO_SERVER_DOWNLOAD_URL='https://downloads.sourceforge.net/project/geoserver/GeoServer/2.17.2/geoserver-2.17.2-war.zip?r=http%3A%2F%2Fgeoserver.org%2Frelease%2Fstable%2F&amp;ts=1599749752&amp;use_mirror=kumisystems'

RUN export DEBIAN_FRONTEND=noninteractive ; \
  apt update \
  && apt upgrade -y \
  && apt install wget unzip --no-install-recommends -y \
  && cd /tmp \
  && wget -O geoserver.zip $GEO_SERVER_DOWNLOAD_URL \
  && unzip geoserver.zip \
  && export WAR_FILE=$(realpath geoserver.war) \
  && cp $WAR_FILE /usr/local/tomcat/webapps/geoserver.war \
  && apt-get purge wget unzip -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /root/.cache && rm -r /var/lib/apt/lists/* && rm -rf /tmp && mkdir /tmp && chmod 777 /tmp && truncate -s 0 /var/log/*.log

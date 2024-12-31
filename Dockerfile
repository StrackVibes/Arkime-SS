
FROM ubuntu:20.04
MAINTAINER Strack

RUN apt-get -qq update && \
    apt-get install -yq curl wget libwww-perl libjson-perl ethtool libyaml-dev file && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Declare args
ARG ARKIME_VERSION=5.5.1
ARG UBUNTU_VERSION=2004_amd64
ARG ES_HOST=elasticsearch
ARG ES_PORT=9200
ARG ARKIME_PASSWORD=password
ARG AKIME_INTERFACE=eth0
ARG CAPTURE=off
ARG VIEWER=on
ARG CONT3XT=on
ARG WISE=on
#Initalize is used to reset the environment from scratch and rebuild a new ES Stack
ARG INITIALIZEDB=false
#Wipe is the same as initalize except it keeps users intact
ARG WIPEDB=false

# Declare envs vars for each arg
ENV ES_HOST $ES_HOST
ENV ES_PORT $ES_PORT
ENV ARKIME_LOCALELASTICSEARCH no
ENV ARKIME_ELASTICSEARCH "http://"$ES_HOST":"$ES_PORT
ENV AKIME_INTERFACE $AKIME_INTERFACE
ENV ARKIME_PASSWORD $AKIME_PASSWORD
ENV ARKIMEDIR "/opt/arkime"
ENV CAPTURE $CAPTURE
ENV VIEWER $VIEWER
ENV CONT3XT $CONT3XT
ENV WISE $WISE
ENV INITIALIZEDB $INITIALIZEDB
ENV WIPEDB $WIPEDB

RUN mkdir -p /data
RUN cd /data && wget "https://github.com/arkime/arkime/releases/download/v${ARKIME_VERSION}/arkime_${ARKIME_VERSION}-1.ubuntu${UBUNTU_VERSION}.deb"
RUN cd /data && dpkg -i "arkime_${ARKIME_VERSION}-1.ubuntu${UBUNTU_VERSION}.deb"
# add scripts
ADD /arkime/scripts /data/
ADD /arkime/etc /opt/arkime/etc/
RUN chmod 755 /data/startarkime.sh /data/wipearkime.sh
#Update Path
ENV PATH="/data:/opt/arkime/bin:${PATH}"

EXPOSE 8005
EXPOSE 3220
WORKDIR /opt/arkime

ENTRYPOINT ["/data/startarkime.sh"]

FROM ubuntu:18.04

MAINTAINER alfin@tlab.co.id

ARG ESVERSION=7.14.1

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
	apt update && apt install curl openjdk-8-jdk -y

RUN cd /opt && curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ESVERSION-linux-x86_64.tar.gz && \
	tar xf elasticsearch-$ESVERSION-linux-x86_64.tar.gz && \
	ln -s /opt/elasticsearch-$ESVERSION /opt/elasticsearch

ENV xpack.ml.enabled=false

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]

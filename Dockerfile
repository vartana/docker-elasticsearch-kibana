FROM ubuntu:latest

MAINTAINER nshou <nshou@coronocoya.net>

RUN apt-get update -q

RUN apt-get install -yq wget default-jre-headless mini-httpd

ENV ES_VERSION 1.7.4

RUN cd /tmp && \
    wget -nv https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz && \
    tar zxf elasticsearch-${ES_VERSION}.tar.gz && \
    rm -f elasticsearch-${ES_VERSION}.tar.gz && \
    mv /tmp/elasticsearch-${ES_VERSION} /elasticsearch

ENV KIBANA_VERSION 3.1.3

RUN cd /tmp && \
    wget -nv https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz && \
    tar zxf kibana-${KIBANA_VERSION}.tar.gz && \
    rm -f kibana-${KIBANA_VERSION}.tar.gz && \
    mv /tmp/kibana-${KIBANA_VERSION} /kibana

CMD /elasticsearch/bin/elasticsearch -Des.http.cors.enabled=true -Des.logger.level=OFF & mini-httpd -d /kibana -h `hostname` -r -D -p 5601

EXPOSE 9200 5601

FROM alpine:latest

MAINTAINER Thomas Hamm <thms.hmm@gmail.com>


ENV FILEBEAT_PACKAGE_URL https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-linux-x86_64.tar.gz

RUN apk update && apk upgrade --available
RUN apk --update add \
  curl \
  tar

WORKDIR /tmp

RUN curl -o filebeat.tar.gz $FILEBEAT_PACKAGE_URL
RUN mkdir /usr/local/filebeat
RUN tar xf filebeat.tar.gz -C /usr/local/filebeat --strip-components=1
RUN rm -f filebeat.tar.gz

WORKDIR /

RUN mkdir /etc/filebeat


ENTRYPOINT ["/usr/local/filebeat/filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]


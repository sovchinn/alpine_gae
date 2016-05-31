FROM golang:1.6.2-alpine
MAINTAINER Serge Ovchinnikov <sovchinn@gmail.com>

ENV GAE_VER 1.9.38
ENV GAE_ZIP go_appengine_sdk_linux_amd64-$GAE_VER.zip

RUN apk --no-cache add \
      bash \
      py-pip \
      python &&\
    pip install --upgrade pip

ADD https://storage.googleapis.com/appengine-sdks/featured/$GAE_ZIP .
RUN unzip -q $GAE_ZIP -d /usr/local
RUN rm $GAE_ZIP

ENV PATH $PATH:/usr/local/go_appengine/

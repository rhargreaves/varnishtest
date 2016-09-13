FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN pip install jinja2
RUN pip install j2cli

ENV VERSION 3.0
RUN curl -sS https://repo.varnish-cache.org/GPG-key.txt | apt-key add - && \
	echo "deb http://repo.varnish-cache.org/ubuntu/ trusty varnish-${VERSION}" >> /etc/apt/sources.list.d/varnish-cache.list && \
	apt-get update && \
	apt-get install -yq varnish

ADD test-vcl.sh /test-vcl.sh

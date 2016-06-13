FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN pip install jinja2
RUN pip install j2cli

RUN mkdir -p /opt/varnish && \
    curl -L https://launchpad.net/ubuntu/+source/varnish/2.1.5-2/+build/2471928/+files/varnish_2.1.5-2_amd64.deb > /opt/varnish/varnish.deb && \
    curl -L https://launchpad.net/ubuntu/+source/varnish/2.1.5-2/+build/2471928/+files/libvarnish1_2.1.5-2_amd64.deb > /opt/varnish/libvarnish1.deb && \
    dpkg -i /opt/varnish/varnish.deb /opt/varnish/libvarnish1.deb && \
    rm -r /opt/varnish && \
    ln -s /usr/sbin /varnishd

ADD test-vcl.sh /test-vcl.sh

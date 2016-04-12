# Testing VCL

A docker image for testing VCL with mocked backends and clients. Currently uses Varnish 2.1.5.

## Setup

First build the docker image:

```
$ docker build -t varnishtest .
```

Or pull down the docker image from https://hub.docker.com/r/roberthargreaves/varnishtest/

```
$ docker pull roberthargreaves/varnishtest
```

## Usage

```
docker run -i -v ~/vcl-testing/tests:/opt/varnish/tests varnishtest:10 varnishtest /opt/varnish/tests/example.vtc
```

## Example VTC Files

You can find examples of tests here in the Varnish source -
https://github.com/varnishcache/varnish-cache/tree/2.1/bin/varnishtest/tests



# Testing VCL

A docker image for testing VCL with mocked backends and clients. Currently uses Varnish 2.1.5.

## Setup

Build the docker image (`make build`) or run:

```
$ docker build -t roberthargreaves/varnishtest .
```

Alternatively, pull the latest docker image using `docker pull roberthargreaves/varnishtest`

```
$ docker pull roberthargreaves/varnishtest
```

## Usage

```
docker run -i -v ~/vcl-testing/tests:/opt/varnish/tests roberthargreaves/varnishtest varnishtest /opt/varnish/tests/example.vtc
```

## Example VTC Files

You can find examples of tests here in the Varnish source -
https://github.com/varnishcache/varnish-cache/tree/2.1/bin/varnishtest/tests



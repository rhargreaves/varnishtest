# Testing VCL

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
docker run -it -v ~/vcl-testing/tests:/opt/varnish/tests varnishtest:10 varnishtest /opt/varnish/tests/example.vtc
```



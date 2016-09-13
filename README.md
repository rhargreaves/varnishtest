# Varnishtest Docker Images

Docker images for testing VCL.

Available to pull from Docker Hub:

* Varnish 2.1.5: `docker pull rhargreaves/varnishtest`
* Varnish 3.0: `docker pull rhargreaves/varnishtest-3.0`

## Setup

Build the docker image:

* Varnish 2.1.5: `docker build -t rhargreaves/varnishtest`
* Varnish 3.0: `docker build -t rhargreaves/varnishtest-3.0 -f Dockerfile-3.0`

## Usage

This tool can be used to test Varnish configuration against VTC files:

```
$ docker run -v $(pwd):/work rhargreaves/varnishtest /test-vcl.sh <vtc_file> <vcl_file>
```

For example:

#### example.vcl

```
sub vcl_deliver {
	set resp.http.X-Hello-World = "Hello World!";
}
```

#### example.vtc

```
test "response header returned"

server s1 {
	rxreq
	expect req.url == "/"
	txresp -body "Hi!"
} -start

varnish v1 -vcl+backend {
  # VCL_PLACEHOLDER
} -start

client c1 {
	txreq
	rxresp
	expect resp.http.X-Hello-World == "Hello World!"
}

client c1 -run
```

Command to run:

```
$ docker run -v $(pwd):/work rhargreaves/varnishtest /test-vcl.sh example.vtc example.vcl
```

## Example VTC Files

You can find examples of tests in the Varnish source:

* Varnish 2.1.5: https://github.com/varnishcache/varnish-cache/tree/2.1/bin/varnishtest/tests
* Varnish 3.0: https://github.com/varnishcache/varnish-cache/tree/3.0/bin/varnishtest/tests




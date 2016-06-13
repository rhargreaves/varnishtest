# Testing VCL

A docker image for testing VCL with mocked backends and clients. Currently uses Varnish 2.1.5.

## Setup

Build the docker image (`make build`) or run `docker build -t roberthargreaves/varnishtest .`

## Usage

This tool can be used to test Varnish configuration against VTC files:

Run `docker run -v $(pwd):/work roberthargreaves/varnishtest /test-vcl.sh <vtc_file> <vcl_file>` 

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
$ docker run -v $(pwd):/work roberthargreaves/varnishtest /test-vcl.sh example.vtc example.vcl
```

## Example VTC Files

You can find examples of tests here in the Varnish source -
https://github.com/varnishcache/varnish-cache/tree/2.1/bin/varnishtest/tests



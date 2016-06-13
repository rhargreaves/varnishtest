NS = rhargreaves
VERSION ?= latest
REPO = varnishtest
NAME = varnishtest

CURRENT_DIR := $(shell pwd)
VTC_FILES := $(patsubst tests/%.vtc,%.vtc,$(wildcard tests/*.vtc))

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

test: $(VTC_FILES)

%.vtc:
	docker run -i -v $(CURRENT_DIR)/tests:/opt/varnish/tests $(NS)/$(REPO) varnishtest /opt/varnish/tests/$@



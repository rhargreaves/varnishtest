NS = roberthargreaves
VERSION ?= latest
REPO = varnishtest
NAME = varnishtest

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

.PHONY: all

all: build tag push

CONTAINERS = base core gateway service-graphs service-machines service-streams
VERSION ?= "latest"

.PHONY: build
build:
	for i in $(CONTAINERS); do \
  		podman build . -f containers/streamsheets-$$i/Dockerfile -t streamsheets-$$i; \
  	done

.PHONY: tag
tag:
	for i in $(CONTAINERS); do \
  		podman tag streamsheets-$$i ghcr.io/ctron/streamsheets-$$i:$(VERSION); \
  	done

.PHONY: push
push:
	for i in $(CONTAINERS); do \
  		podman push ghcr.io/ctron/streamsheets-$$i:$(VERSION); \
  	done

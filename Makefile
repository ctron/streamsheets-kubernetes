.PHONY: all

all: build tag push

CONTAINERS = core gateway service-graphs service-machines service-streams

.PHONY: build
build:
	for i in $(CONTAINERS); do \
  		podman build . -f containers/streamsheets-$$i/Dockerfile -t streamsheets-$$i; \
  	done

.PHONY: tag
tag:
	for i in $(CONTAINERS); do \
  		podman tag streamsheets-$$i ghcr.io/ctron/streamsheets-$$i:latest; \
  	done

.PHONY: push
push:
	for i in $(CONTAINERS); do \
  		podman push ghcr.io/ctron/streamsheets-$$i:latest; \
  	done

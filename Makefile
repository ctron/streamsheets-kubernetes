.PHONY: all

all: build tag push

CONTAINERS = base core gateway service-graphs service-machines service-streams
VERSION ?= latest
CONTAINER_REGISTRY ?= ghcr.io/ctron

.PHONY: build
build:
	for i in $(CONTAINERS); do \
  		podman build . -f containers/streamsheets-$$i/Dockerfile -t streamsheets-$$i; \
  	done

.PHONY: tag
tag:
	for i in $(CONTAINERS); do \
  		podman tag streamsheets-$$i $(CONTAINER_REGISTRY)/streamsheets-$$i:$(VERSION); \
  	done

.PHONY: push
push:
	for i in $(CONTAINERS); do \
  		podman push $(CONTAINER_REGISTRY)/streamsheets-$$i:$(VERSION); \
  	done

copy-helm:
	rsync -av charts/streamsheets ~/git/helm-charts/charts/

FROM registry.access.redhat.com/ubi8

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

#
# This container holds all the basic NodeJS components that we need later on.
#

RUN dnf module -y install nodejs:14/development
RUN dnf install -y npm
RUN npm install --global yarn

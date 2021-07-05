FROM registry.access.redhat.com/ubi8

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

RUN dnf module -y install nodejs:14/development

RUN dnf install -y npm

RUN npm install --global yarn

RUN mkdir /streamsheets

COPY external/streamsheets /streamsheets

WORKDIR /streamsheets

RUN yarn install --frozen-lockfile

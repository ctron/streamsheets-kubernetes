FROM registry.access.redhat.com/ubi8:latest

ARG GIT_BRANCH="release/2.3"

RUN dnf install -y git

RUN git clone --depth 1 https://github.com/eclipse/streamsheets -b "$GIT_BRANCH"

WORKDIR streamsheets

RUN mkdir -p packagejsons
RUN mkdir /build

RUN tar cf packagejsons.tar packages/*/package.json packages/*/*/package.json
RUN tar xf packagejsons.tar -C packagejsons

RUN dnf install -y npm
RUN npm install --global yarn
RUN yarn install --frozen-lockfile

RUN cp -r .yarnrc package.json yarn.lock ./scripts/workspace-util.js /build/
RUN cp -r ./npm-packages-offline-cache  /build/npm-packages-offline-cache
RUN cp -r ./packages  ./packages-with-source
RUN cp -r ./packagejsons /build


FROM streamsheets-core as builder

WORKDIR /streamsheets

RUN yarn workspace @cedalo/gateway build
RUN yarn workspace @cedalo/webui build

FROM registry.access.redhat.com/ubi8

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

RUN dnf module -y install nodejs:14/development
RUN dnf install -y npm
RUN npm install --global yarn

RUN mkdir /streamsheets
COPY --from=builder /streamsheets/.yarnrc /streamsheets/package.json /streamsheets/yarn.lock /streamsheets/
COPY --from=builder /streamsheets/packages /streamsheets/packages

WORKDIR /streamsheets
RUN yarn install --production --frozen-lockfile
COPY --from=builder /streamsheets/packages/webui/build /streamsheets/packages/gateway/public

ENV NODE_ENV="production"

CMD node /streamsheets/packages/gateway/out/start.js

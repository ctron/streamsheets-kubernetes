FROM streamsheets-core as builder

WORKDIR /streamsheets

#
# Build the gateway and web UI, which is served by the gateway
#

RUN yarn install --frozen-lockfile
RUN yarn workspace @cedalo/gateway build
RUN yarn workspace @cedalo/webui build

FROM streamsheets-base

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

#
# Assembling "only" the necessary components, reduces the overall size by around 700MiB
#

RUN mkdir /streamsheets
COPY --from=builder /streamsheets/.yarnrc /streamsheets/package.json /streamsheets/yarn.lock /streamsheets/
COPY --from=builder /streamsheets/packages /streamsheets/packages

WORKDIR /streamsheets
RUN yarn install --production --frozen-lockfile
COPY --from=builder /streamsheets/packages/webui/build /streamsheets/packages/gateway/public

ENV NODE_ENV="production"

CMD node /streamsheets/packages/gateway/out/start.js

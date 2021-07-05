FROM streamsheets-core

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

WORKDIR /streamsheets

RUN yarn workspace @cedalo/gateway build

ENV NODE_ENV="production"

CMD node /streamsheets/packages/gateway/out/start.js

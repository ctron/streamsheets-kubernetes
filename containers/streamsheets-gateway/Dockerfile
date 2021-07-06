FROM streamsheets-core

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

WORKDIR /streamsheets

RUN yarn workspace @cedalo/gateway build
RUN yarn workspace @cedalo/webui build

RUN cp -r packages/webui/build/* /streamsheets/packages/gateway/public/

ENV NODE_ENV="production"

CMD node /streamsheets/packages/gateway/out/start.js

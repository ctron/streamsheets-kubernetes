FROM streamsheets-core

WORKDIR /streamsheets

RUN yarn workspace @cedalo/gateway build

ENV NODE_ENV="production"

CMD node /streamsheets/packages/gateway/out/start.js

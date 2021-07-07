FROM streamsheets-core

#
# Build the graphs service: install production dependencies only and set the start command
#

WORKDIR /streamsheets
RUN yarn install --production --frozen-lockfile

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"
ENV NODE_ENV="production"

CMD node /streamsheets/packages/service-graphs/start.js

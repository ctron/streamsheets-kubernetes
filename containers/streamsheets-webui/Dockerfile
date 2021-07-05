FROM streamsheets-core

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

WORKDIR /streamsheets

RUN yarn workspace @cedalo/webui build

ENV NODE_ENV="production"

RUN mkdir -p /app
RUN npm i -g pushstate-server@3.0.1

WORKDIR /app

RUN cp -r /streamsheets/packages/webui/build/* .

EXPOSE 9000

CMD [ "pushstate-server", "./" ]

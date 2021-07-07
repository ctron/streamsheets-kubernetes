FROM streamsheets-base

LABEL org.opencontainers.image.source="https://github.com/ctron/streamsheets-kubernetes"

#
# Ths container holds the source for Streamsheets, so that dependent containers can process it.
#
# We don't build anything yet, or install dependencies. As we do this later, what and when required. Otherwise
# this will bloat our images.
#

RUN mkdir /streamsheets
COPY /external/streamsheets/.yarnrc /external/streamsheets/package.json /external/streamsheets/yarn.lock /streamsheets/
COPY /external/streamsheets/packages /streamsheets/packages


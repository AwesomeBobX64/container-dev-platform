ARG ALPINE_VERSION=3.17

FROM alpine:${ALPINE_VERSION} AS base

COPY scripts/install-base.sh /usr/local/bin

RUN /usr/local/bin/install-base.sh

FROM base AS ci

COPY scripts/install-ci.sh /usr/local/bin

RUN /usr/local/bin/install-ci.sh

FROM ci AS dev

RUN npm install -g node-dev

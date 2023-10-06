ARG ALPINE_VERSION=3.17
ARG IMAGE_VERSION=1.0.0

FROM alpine:${ALPINE_VERSION} AS base

COPY scripts/install-base.sh /usr/local/bin

RUN /usr/local/bin/install-base.sh

FROM base AS ci

COPY scripts/install-ci.sh /usr/local/bin

RUN /usr/local/bin/install-ci.sh

FROM ci AS dev

COPY scripts/install-dev.sh /usr/local/bin

RUN /usr/local/bin/install-dev.sh

# NPM Global Cache Dir
VOLUME /root/.npm
# Yarn Cache Dir
VOLUME /usr/local/share/.cache/yarn/v6

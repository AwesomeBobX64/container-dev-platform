# Define Alpine Linux and image version variables
ARG ALPINE_VERSION=3.17
ARG IMAGE_VERSION=1.0.0

# Base layer with minimal OS and language runtime
FROM alpine:${ALPINE_VERSION} AS base
COPY scripts/install-base.sh /usr/local/bin
RUN /usr/local/bin/install-base.sh

# CI layer with additional dependencies
FROM base AS ci
COPY scripts/install-ci.sh /usr/local/bin
RUN /usr/local/bin/install-ci.sh

# Development layer with specific tooling
FROM ci AS dev
COPY scripts/install-dev.sh /usr/local/bin
RUN /usr/local/bin/install-dev.sh

# Create volume mounts for NPM and Yarn caches
VOLUME /root/.npm
VOLUME /usr/local/share/.cache/yarn/v6
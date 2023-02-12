#!/usr/bin/env bash
set -euo pipefail

source ./scripts/docker-functions.sh

for dockerfile in $(get_all_dockerfiles); do
  build_targets_in_dockerfile "$dockerfile"
done

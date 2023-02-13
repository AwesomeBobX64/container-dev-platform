#!/usr/bin/env bash
set -euo pipefail

get_all_dockerfiles() {
  find ./images -name Dockerfile
}

get_image_name_from_dockerfile() {
  echo "$1" | sed -E 's|\./images/(.+)/Dockerfile|\1|g'
}

get_all_targets_from_dockerfile() {
  grep -E "^FROM .+ AS (.+)" "$1" | sed -E 's/.+ AS (.+)/\1/g'
}

build_targets_in_dockerfile() {
  DOCKERFILE=$1
  IMAGE_NAME=$(get_image_name_from_dockerfile "$DOCKERFILE")
  for target in $(get_all_targets_from_dockerfile "$DOCKERFILE"); do
    docker build -t "$IMAGE_NAME:$target" --target="$target" -f "$DOCKERFILE" "$(dirname "$DOCKERFILE")"
  done
}

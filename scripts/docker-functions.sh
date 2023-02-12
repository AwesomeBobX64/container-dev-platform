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

get_image_version_from_dockerfile() {
  grep -E "^ARG IMAGE_VERSION=(.+)" "$1" | sed -E 's/.+=(.+)/\1/g'
}

build_target() {
  IMAGE_NAME="$1"
  TARGET="$2"
  DOCKERFILE="$3"
  IMAGE_VERSION="$4"

  docker build -t "$IMAGE_NAME:$TARGET-$IMAGE_VERSION" --target="$TARGET" -f "$DOCKERFILE" "$(dirname "$DOCKERFILE")"
}

build_targets_in_dockerfile() {
  DOCKERFILE=$1
  IMAGE_NAME=$(get_image_name_from_dockerfile "$DOCKERFILE")

  for target in $(get_all_targets_from_dockerfile "$DOCKERFILE"); do
    build_target "$IMAGE_NAME" "$target" "$DOCKERFILE" "$(get_image_version_from_dockerfile "$DOCKERFILE")"
  done
}

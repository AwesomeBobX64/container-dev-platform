#!/usr/bin/env bash
set -euo pipefail

echo "Checking for Docker..."
if [[ ! $(which docker) ]]; then
  echo "Installing Docker..."
  brew install docker
fi

echo "Docker already installed..."

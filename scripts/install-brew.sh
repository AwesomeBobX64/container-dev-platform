#!/usr/bin/env bash
set -euo pipefail

echo "Checking for Homebrew..."
if [[ ! $(which brew) ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Homebrew installed..."

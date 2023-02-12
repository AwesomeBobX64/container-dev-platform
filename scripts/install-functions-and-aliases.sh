#!/usr/bin/env bash
set -euo pipefail

HOME_BIN="${HOME}/bin"
BASHRC="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
INSTALL_FILE="platform-functions-and-aliases.sh"
SOURCE_LINE="source ${HOME_BIN}/${INSTALL_FILE}"

# Create home ./bin dir if it does not exist
[[ -d "${HOME_BIN}" ]] || mkdir "${HOME_BIN}"

# Idempotently copy our install file
cp "./scripts/${INSTALL_FILE}" "${HOME_BIN}/${INSTALL_FILE}"

# Install in .bashrc or .zshrc
for RC_FILE in "${BASHRC}" "${ZSHRC}"; do
  if [[ -f "${RC_FILE}" ]]; then
    if ! grep -q "${SOURCE_LINE}" "${RC_FILE}"; then
      echo """
# Container Dev Platform Functions and Aliases
${SOURCE_LINE}
""" >> "${RC_FILE}"
    fi
  fi
done

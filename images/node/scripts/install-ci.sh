#!/usr/bin/env sh
set -euo

apk add --update --no-cache npm yarn git

npm install -g jest heroku

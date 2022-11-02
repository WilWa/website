#!/bin/bash

cd /src/website-vue
yarn install --inline-builds
cd /src/
(trap 'kill 0' SIGINT; \
yarn --cwd /src/website-vue dev & \
tail -f /dev/null)

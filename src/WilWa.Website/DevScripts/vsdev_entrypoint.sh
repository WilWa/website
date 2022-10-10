#!/bin/bash

cd /src/src/website-vue
yarn install
yarn dev
tail -f /dev/null
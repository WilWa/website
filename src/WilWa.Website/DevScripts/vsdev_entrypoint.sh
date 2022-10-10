#!/bin/bash

cd /src/website-vue
yarn install
yarn dev
tail -f /dev/null
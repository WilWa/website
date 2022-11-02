#!/bin/bash

cd /app/website-vue
yarn install --inline-builds
cd /app
(trap 'kill 0' SIGINT; \
yarn --cwd /app/website-vue dev & \
dotnet watch --project "/app/WilWa.Website/WilWa.Website.csproj" run)
#!/usr/bin/env bash

docker build -t zorag/beer-app-frontend client/
docker push zorag/beer-app-frontend
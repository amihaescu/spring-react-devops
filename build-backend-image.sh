#!/usr/bin/env bash
mvn clean install

docker build -t zorag/beer-app-backend .
docker push zorag/beer-app-backend
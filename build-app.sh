#!/usr/bin/env bash
mvn clean install

docker build -t zorag/beer-app-backend .
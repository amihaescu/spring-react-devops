#!/usr/bin/env bash
kubernetes create -f backend-deployment.yaml
kubernetes create -f backend-service.yaml
kubernetes create -f frontend-deployment.yaml
kubernetes create -f frontend-service.yaml
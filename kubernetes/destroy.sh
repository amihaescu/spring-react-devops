#!/usr/bin/env bash
kubectl delete service beers-app-service
kubectl delete service beers-app-fe-service
kubectl delete deployment beers-back-end-deployment
kubectl delete deployment beers-front-end-deployment
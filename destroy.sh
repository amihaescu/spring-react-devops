#!/usr/bin/env bash
echo "---- Destroying AWS resources ----";
pushd terraform
terraform destroy -force
popd
echo "---- Finished destroying AWS resources ----";

echo "---- Destroying Kubernetes resources ----";
kubectl delete service beers-app-service
kubectl delete service beers-app-fe-service
kubectl delete deployment beers-back-end-deployment
kubectl delete deployment beers-front-end-deployment
echo "---- Finished destroying Kubernetes resources ----";
#!/usr/bin/env bash
echo "---- Destroying AWS resources ----";
pushd terraform
terraform destroy -force
popd
echo "---- Finished destroying AWS resources ----";

echo "---- Destroying Kubernetes resources ----";
kubectl delete -f kubernetes/backend-deployment.yaml
kubectl delete -f kubernetes/frontend-deployment.yaml
echo "---- Finished destroying Kubernetes resources ----";
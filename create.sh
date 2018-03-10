#!/usr/bin/env bash

echo "==== Started building back-end Docker image ===="
./build-backend-image.sh
echo "==== Finished building back-end Docker image ===="

echo "==== Started building front-end Docker image ===="
./build-frontend-image.sh
echo "==== Finished building front-end Docker image ===="

echo "==== Started deploying Kubernetes backend ===="
kubectl create -f kubernetes/backend-deployment.yaml
echo "==== Finished deploying Kubernetes backend ===="

echo "==== Started deploying Kubernetes frontend ===="
kubectl create -f kubernetes/frontend-deployment.yaml
echo "==== Finished deploying Kubernetes frontend ===="

BEER_API=$(kubectl get service beers-app-service -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')
BEER_FE=$(kubectl get service beers-app-fe-service -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')

while { [ -z  "$BEER_API" ] || [ -z "$BEER_FE" ]; }
do
    BEER_API=$(kubectl get service beers-app-service -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')
    BEER_FE=$(kubectl get service beers-app-fe-service -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')
    echo "Waiting for load-balancer to be created. Sleeping for 10s...";
    sleep 10;
done

echo "Load-balancer created..."
echo $BEER_API
echo $BEER_FE

echo "==== Started deploying terraform ===="
pushd terraform
terraform init
terraform apply -auto-approve -var beer_api_lb=$BEER_API -var beer_fe=$BEER_FE


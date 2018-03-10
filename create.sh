#!/usr/bin/env bash
kubectl create -f kubernetes/backend-deployment.yaml

kubectl create -f kubernetes/frontend-deployment.yaml

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

pushd terraform
terraform init
terraform apply -auto-approve -var beer_api_lb=$BEER_API -var beer_fe=$BEER_FE


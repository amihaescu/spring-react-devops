# SpringBoot - React - Kubernetes - AWS 

This project sets out to prove how to develier an application to the cloud i.e. a Kuberentes cluster that's running within AWS
 - the application is very simple - just shows up 2 differents lists of beers - and is based of this tutorial [bootiful development](https://www.javacodegeeks.com/2018/01/bootiful-development-spring-boot-react.html)
 - it is actually split into two distinct applications : FE - the react part and BE - the spring boot api
 - everything is containerised and updloaded to docker hub
 - a replica-set of 3 pods are created within the cluster for BE and only 1 pod for front-end
 - everything can be created and deleted with the `create.sh` and `destroy.sh` scripts

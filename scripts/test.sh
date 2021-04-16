#! /usr/bin/env bash

set -e

bash scripts/build.sh

# Setup k8s cluster
kind create cluster

kubectl apply --wait -f k8s/deployment.yml 

kubectl exec -it deploy/fastapi-deployment -- curl http://localhost:80
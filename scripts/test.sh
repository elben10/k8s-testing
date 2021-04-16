#! /usr/bin/env bash

set -e

bash scripts/build.sh

# Setup k8s cluster
kind create cluster

kubectl apply -f k8s/deployment.yml

kubectl wait --for=condition=available --timeout=60s --all deployments

kubectl exec -it deploy/fastapi-deployment -- curl http://localhost:80
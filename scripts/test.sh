#! /usr/bin/env bash

set -e

bash scripts/build.sh

kind load docker-image ghcr.io/elben10/dummy:latest

kubectl apply -f k8s/deployment.yml

kubectl wait --for=condition=available --timeout=60s --all deployments

kubectl exec -it deploy/fastapi-deployment -- bash  -c 'curl http://localhost'

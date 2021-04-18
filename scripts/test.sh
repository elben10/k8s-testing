#! /usr/bin/env bash

set -e

bash scripts/build.sh

kind create cluster

python scripts/load-images-into-k8s.py

kubectl apply -f k8s/deployment.yml

kubectl wait --for=condition=available --timeout=60s --all deployments

kubectl exec -it deploy/fastapi-deployment -- bash  -c 'curl http://localhost'

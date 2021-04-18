#! /usr/bin/env bash

set -e

bash scripts/build.sh

kubectl apply -f k8s/deployment.yml

kubectl wait --for=condition=available --timeout=60s --all deployments

kubectl describe pod $(kubectl get pod -l app=fastapi -o jsonpath="{.items[0].metadata.name}")

kubectl exec -it deploy/fastapi-deployment -- bash curl http://localhost

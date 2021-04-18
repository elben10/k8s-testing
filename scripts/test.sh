#! /usr/bin/env bash

set -e

# Build test images
bash scripts/build.sh

# Setup kind - k8s in docker
kind create cluster --config=config/kind.yml

# Install Ingress-Nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx

# # Load custom images into cluster
# python scripts/load-images-into-k8s.py

kubectl get service

curl http://localhost

# kubectl apply -f k8s/deployment.yml

# kubectl wait --for=condition=available --timeout=60s --all deployments

# kubectl exec -it deploy/fastapi-deployment -- bash  -c 'curl http://localhost'

# bash scripts/build-push.sh
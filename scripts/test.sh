#! /usr/bin/env bash

set -e

bash scripts/build.sh

# Setup k8s cluster
kind create cluster

kubectl apply -f k8s/deployment.yml

sleep 30

kubectl describe $(kubectl get pod -l app=fastapi -o jsonpath="{.items[0].metadata.name}")
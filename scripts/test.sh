#! /usr/bin/env bash

set -e

bash scripts/build.sh

# Setup k8s cluster
kind create cluster

kubectl apply -f k8s/deplyment.yml
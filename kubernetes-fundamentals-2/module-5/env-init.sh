#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Install traefik
helm install --name traefik --namespace kube-system --set serviceType=NodePort stable/traefik

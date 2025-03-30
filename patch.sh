#!/bin/bash

# Solution to get the real IP passed to the pods
# By setting it to "Local", you're telling Kubernetes not to perform SNAT on incoming traffic,
# which preserves the original client IP address.
# With the default "Cluster" policy, Kubernetes routes traffic through
# internal proxying that replaces the source IP with the node's IP.
kubectl patch svc ingress-nginx-controller -n ingress-nginx -p '{"spec":{"externalTrafficPolicy":"Local"}}'
kubectl rollout restart deployment/ingress-nginx-controller -n ingress-nginx

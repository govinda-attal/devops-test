#!/usr/bin/env bash
kubectl create -f rbac-config.yaml
helm init --service-account tiller

helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true

#!/usr/bin/env bash

helm install --name bravo ./articles-api --namespace demo-backend

sleep 5

echo when success two pods should be listed one with status 'Running' and another one with status 'Completed'
kubectl get pods -n demo-backend
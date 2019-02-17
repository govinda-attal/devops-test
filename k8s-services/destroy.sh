#!/usr/bin/env bash

echo Deleting postgres release named 'demo'
helm delete --purge demo
echo Deleted postgres release named 'demo' successfully

sleep 2

echo Deleting ingress controller release named 'nginx-ingress'
helm delete --purge nginx-ingress
echo Deleted ingress controller release named 'nginx-ingress' successfully

sleep 2

echo Deleting 'adminer' deployment and service
kubectl delete -f adminer.yml -n db

sleep 2

echo Deleting 'tiller' deployment
kubectl delete deployment tiller-deploy -n kube-system
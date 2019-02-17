#!/usr/bin/env bash

echo have you edited file values.yaml with valid public IP address of nginx ingress controller
sleep 3

helm install --name bravo ./articles-api --namespace demo-backend
echo articles-api configured successfully ✔, sleeping for 20 seconds to allow PODS to be relevant status

echo API POD is expected in status 'Running' and API database migration POD is expected in status 'Completed'
sleep 20
kubectl get pods -n demo-backend

echo even for some reason database migration pod shows in 'Error' status, please check that articles schema and tables are provisioned
echo browse to http://localhost:8080/?pgsql=demo-postgresql&username=postgres&db=postgres&ns=articles
echo given that adminer service is port forward to localhost:8080
echo If schema 'articles' has table 'article' the purpose of the pod is achieved. 
echo But Backend Rest API pod must be in 'Running' status.
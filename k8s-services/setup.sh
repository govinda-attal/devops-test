#!/usr/bin/env bash

kubectl apply -f rbac-config.yml
helm init --service-account tiller


sleep 30

helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true

helm install --name demo stable/postgresql --namespace db \
    --set image.repository=postgres \
    --set image.tag=10.6 \
    --set postgresqlPassword=password \
    --set postgresqlDatabase=postgres \
    --set persistence.mountPath=/data/ \
    --set postgresqlDataDir=/data/pgdata
     
kubectl apply -f adminer.yml -n db

sleep 2
echo now we will port forward adminer service to localhost port 8080 allowing us to access adminer on http://localhost:8080
echo keep this terminal running
kubectl port-forward svc/adminer -n db 8080:8080

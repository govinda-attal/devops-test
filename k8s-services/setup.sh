#!/usr/bin/env bash

echo Configuring tiller
kubectl apply -f rbac-config.yml
helm init --service-account tiller

echo Tiller configured successfully ✔, waiting for 30 seconds to allow tiller POD in 'Running' status

sleep 30

echo Configuring nginx ingress controller
helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true
echo Nginx ingress controller configured successfully ✔

echo Configuring postgres
helm install --name demo stable/postgresql --namespace db \
    --set image.repository=postgres \
    --set image.tag=10.6 \
    --set postgresqlPassword=password \
    --set postgresqlDatabase=postgres \
    --set persistence.mountPath=/data/ \
    --set postgresqlDataDir=/data/pgdata

echo Postgres configured successfully ✔, sleeping for 30 seconds to allow postgres POD in 'Running' status
sleep 30
kubectl get pods -n db     

echo Configuring Adminer utility
kubectl apply -f adminer.yml -n db
echo Adminer configured successfully ✔ waiting for 10 seconds to allow adminer POD in 'Running' status

sleep 10
echo now we will port forward adminer service to localhost port 8080 allowing us to access adminer on http://localhost:8080
echo keep this terminal running
kubectl port-forward svc/adminer -n db 8080:8080

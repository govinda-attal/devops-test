#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=./creds/serviceaccount.json

cd resources
terraform init
terraform apply -auto-approve
cd ..

source .env

gcloud container clusters get-credentials demo-k8s --zone australia-southeast1-a --project $GCLOUD_PRJ_NAME
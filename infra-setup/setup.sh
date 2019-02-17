#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=./creds/serviceaccount.json

cd vpc
terraform init
terraform apply
cd ..

cd k8s 
terraform init
terraform apply
cd ..

gcloud container clusters get-credentials demo-k8s --zone australia-southeast1-a --project $GCLOUD_PRJ_NAME
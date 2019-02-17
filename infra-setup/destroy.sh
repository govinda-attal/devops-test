#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=./creds/serviceaccount.json

cd k8s 
terraform destroy
cd ..

cd vpc
terraform destory
cd ..

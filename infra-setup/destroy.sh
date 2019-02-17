#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=./creds/serviceaccount.json

cd resources 
terraform destroy -auto-approve
cd ..

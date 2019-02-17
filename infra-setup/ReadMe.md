# Infrastrucure

The scripts here will setup following services on GCP

1. A custom Virtual Private Cloud (VPC)
2. A regional sub-network with CIDR - `10.2.0.0/16`
3. A Kubernetes Cluster with one node of machine type `n1-standard-4` and GKE version `1.11.6-gke.11`

## Requirements

* terraform installed locally. refer to https://learn.hashicorp.com/terraform/getting-started/install.html
* gcloud cli installed locally. refer to https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
* kubectl cli installed locally. refer to https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Pre-Setup Instructions

1. Create a Project on GCP and update the file .env with correct project ID for environment variable `GCLOUD_PRJ_NAME`
2. Create a Service account named `terraform` on GCP with roles as [Project Editor, Kubernetes Engine Admin]
3. Create a service account named `demo-k8s` on GCP with roles as [Compute Admin]
4. Generate a key for service account `terraform` and download same in JSON format.
5. Rename the service account key file to `serviceaccount.json` and place it in `./creds/` directory

## Setup Instructions

Run the file setup.sh

```
./setup.sh
```

Give it a reasonable time of around 5-7 minutes and following services are provisioned on GCP
1. VPC named 'demo-network'
2. Subnetwork named 'demo-sub-network' within above VPC
3. GKE cluster named 'demo-k8s' within above sub-network in zone `australia-southeast1-a`
4. It will authenticate gcloud cli with service account credentials and also configure kubectl client with the provisioned K8s cluster

## Cleanup Instructions

>> Only when you are finished with the purpose of validating the solution

Run the file destroy.sh

```
./destroy.sh
```

## Customize terraform deployment variables

Browse to resources folder and edit `variables.tf` as suits.
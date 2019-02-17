
# Solution for a DevOps test

## Purpose

The solution provisions the infrastructure required for a traditional 3-tier architecture.


For my current skillsets, I have chosen GCP over AWS - purely to save sometime on test solution. 

* Stretch Goals
    * Have chosen to build my own application and necessary deployment artifacts
        * REST API - implemented in Golang: https://github.com/govinda-attal/articles-api
        * Terraform files to provision infrastructure - VPC, Subnetwork, K8s cluster on GCP
        * Helm Charts both opensource (deploy ngnix and postgres) and Custom (deploy custom REST API application)



* Cloud best practices and patterns (inc. security)
    * Custom VPC with a Subnetwork
    * GKE with nginx ingres controller: a best practice to expose application services on Kubernetes Cluster.
    * API calls are secured with HTTPS

* Stretch goal:
    * A REST API implemented in Golang that integrates with Posgres DB

* Kubernetes as container orchestration tool - GKE hosted on GCP

* Deliverables
    * Git repository with README.md(s)
    * Included: Terraform code, Helm Charts, Kubernetes object files and necessary bash scripts

## Setup Instructions

Follow instructions in following order
1. [./infra-setup/ReadMe.md](./infra-setup/ReadMe.md)
2. [./k8s-services/ReadMe.md](./k8s-services/ReadMe.md)
3. [./helm-chart/ReadMe.md](./helm-chart/ReadMe.md)


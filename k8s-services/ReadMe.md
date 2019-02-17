

# Kubernetes and services

Following services (or helm charts) will be installed on K8s cluster
1. Nginx ingress controller - To expose backend services deployed on Kubernetes.
2. Postgres DB - Sample backend application (articles-api) integrates with Postgres DB

Stable Helm Charts available on https://github.com/helm/charts will be used for above set of services.

Other than above services a utility application named `adminer` will also be deployed on K8s cluster using standard kubernetes objects like deployments and services.

## Requirements

* gcloud cli installed locally. refer to https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
* kubectl cli installed locally. refer to https://kubernetes.io/docs/tasks/tools/install-kubectl/
* Helm Client is installed locally. Refer to https://docs.helm.sh/using_helm/#installing-the-helm-client
* Setup Infrastructure services as per Readme instructions in `../infra-setup/ReadMe.md`

>> Followed instructions as per `../infra-setup/ReadMe.md`? 

## Setup Instructions

Run setup.sh
```
./setup.sh
```

### Using Adminer to check Postgres
Note keep this terminal running if you wish to access adminer running to see updates on backend postgres DB

Login to PostgresDB using adminer : http://localhost:8080/?pgsql=demo-postgresql&username=postgres&db=postgres
Enter password as `password`

### Loadbalancer IP adderss of nginx ingress controller on K8s 
Now we need to note down the IP Address of Nginx ingress controller. Later we will need it to configure backend API that integrates with Postgres DB.
1. Browse to Services section of the provisioned GKE cluster on GCP 
`https://console.cloud.google.com/kubernetes/discovery?project=<genial-broker-231710>`
2. Copy Public IP Address of nginx-ingress-controler (a load balancer service)

>> Note: We could use free DNS service from xip to use a valid hostname as `<XX.XX.XX.XX>.xip.io` . Later Backend API will be accessed with this hostname. 

## Cleanup Instructions 

>> Only when you are finished with the purpose of validating the solution

Run destroy.sh

```
destroy.sh
```
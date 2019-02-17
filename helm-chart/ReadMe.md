# Install a custom Golang Application

With instructions below we should be able to setup a simple backend application that integrates with Postgres DB.
This sample application is implemented in Golang and is available on Github at https://github.com/govinda-attal/articles-api


## Requirements

* gcloud cli installed locally. refer to https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
* kubectl cli installed locally. refer to https://kubernetes.io/docs/tasks/tools/install-kubectl/
* Helm Client is installed locally. refer to https://docs.helm.sh/using_helm/#installing-the-helm-client
* Setup Infrastructure services as per Readme instructions in [../infra-setup/ReadMe.md](../infra-setup/ReadMe.md)
* Setup Kubernetes services as per Readme instructions in [../k8s-services/ReadMe.md](../k8s-services/ReadMe.md)
* Postman to test APIs. refer to https://www.getpostman.com/downloads/

>> Followed instructions as per [../infra-setup/ReadMe.md](../infra-setup/ReadMe.md)?

>> Followed instructions as per [../k8s-services/ReadMe.md](../k8s-services/ReadMe.md)? 

## Setup Instructions

Before you run the script below:
1. Ensure that Postgres DB is running and you were able to login with adminer utility
2. You have edited [./articles-api/values.yaml](./articles-api/values.yaml) file with valid load balancer IP address (ngnix ingress controller public IP address).
    * line number 37 and 42 in [./articles-api/values.yaml](./articles-api/values.yaml)

Run setup.sh
```
./setup.sh
```

>> Note: If need be the CI/CD tools like Harness or Codefresh could be used to deploy helm charts to K8s cluster instead of bash scripts.

Swagger Spec can be seen https://demo.<public-ip>.xip.io/swaggerui/?url=https://demo.<public-ip>.xip.io/api/api/swagger.yaml
(but cannot be tested using URL, instead use Postman as below)

### Using Postman to test Articles API 

1. Start postman utility
2. Import postman collection [articles-api.postman_collection.json](../postman-collection/articles-api.postman_collection.json)
3. Update API Endpoint URLs for all requests with valid public IP address of nginx ingress controller
4. Fire API requests in following order: [Add Article, Fetch Article, Fetch Tag Summary]


## Cleanup Instructions

>> Only when you are finished with the purpose of validating the solution


Run destroy.sh
```
./destroy.sh
```

>> Next perform cleanup instructions as per [../k8s-services/ReadMe.md](../k8s-services/ReadMe.md) & [../infra-setup/ReadMe.md](../infra-setup/ReadMe.md) (in order)
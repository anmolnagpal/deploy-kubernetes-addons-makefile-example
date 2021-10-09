Deploy Kubernetes addons using Makefiles
========================================

> This repository demonstrate how **make** and **Makefiles** can be used to
deploy and organize configuration of Kubernetes addons such as nginx-ingress,
external-dns, cluster-autoscaler, etc.

> This method is fairly simple and let you decide what application and which
version can be deployed to a given environment. Configuration can be shared
accross environment. The steps to execute the deployment of an application are
independant from each other which provide flexibility.

## Overview

Each application should be stored into its own directory. Each Makefile
contains the instructions to deploy an application to an environment. It can be
kubectl, Azure CLI or anything that can be used to deploy infrastructure
components.

When executing the command `make deploy-all` from the root, make will loop
through all the application defined in the `APPS` variable from the
`env.<ENVIRONMENT>.mk` file then call the `deploy` target from each application
directory.

```
├── external-dns
│   ├── Makefile
│   ├── README.md
│   ├── values.common.yaml
│   ├── values.development.yaml
│   └── values.production.yaml
├── limit-ranges
│   ├── development.yaml
│   ├── Makefile
│   ├── production.yaml
│   └── README.md
├── Makefile
├── namespaces
│   ├── development.yaml
│   ├── Makefile
│   ├── production.yaml
│   └── README.md
├── nginx-ingress
│   ├── common.yaml
│   ├── development.yaml
│   ├── Makefile
│   ├── production.yaml
│   └── README.md
├── psp
│   ├── common
│   │   └── app-default.yaml
│   ├── development
│   ├── Makefile
│   ├── production
│   └── README.md
├── rbac
│   ├── common
│   │   └── cicd-user.yaml
│   ├── development
│   │   ├── cicd-user.yaml
│   │   ├── user-1.yaml
│   │   └── user-2.yaml
│   ├── Makefile
│   ├── production
│   │   └── cicd-user.yaml
│   └── README.md
├── common.mk                    # Common environment variables which we need for all environments
├── env.development.mk           # environment variables for development 
├── env.production.mk            # environment variables for development 
└── README.md
```

- **Environment files** define what application and which version should be
deployed in a given infrastructure environment
- **Application directories** contain the configuration and the script used to
deploy an application


## Usage

When deploying infrastructure components it is wise to test new settings in a
local or test environment. In the following example, we use
[Minikube][minikube] in order to test new configuration.

```bash
# display help
$ ENVIRONMENT=development make help

# deploy all applications to the development cluster
$ ENVIRONMENT=development make deploy-all

# deploy a single application to the development cluster
$ ENVIRONMENT=development make deploy-nginx-ingress

# destroy all applications to the development cluster
$ ENVIRONMENT=development make destroy-all

# destroy a single application to the development cluster
$ ENVIRONMENT=development make destroy-nginx-ingress
```
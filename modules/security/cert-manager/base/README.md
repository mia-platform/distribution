# Cert-manager Module

Cert-manager is an operator that manages the request and issuing of X.509 certificates on a Kubernetes cluster.
With Cert-manager you can define certificate issuers, check the status of the certificates already present and renew them.

[Here is the link to the official repository.](https://github.com/cert-manager/cert-manager)

## What the base module contains

- **CRDs:** Cert-manager custom resource definitions
- **Resources:**
  - **Ca-injector:** Deployment responsible of injecting the certificates in the various cluster resources.
  - **Cert-manager:** Deployment responsible of managing the life-cycle of certificates.
  - **Configs:** Namespace and networkpolicy to manage the Cert-manager resources.
  - **Webhook:** A webhook responsible for validation, defaulting and conversion (converts version of the resources to support multiple versin simultaneously).
  - **RBAC:** service account, `ClusterRole` and `ClusterRoleBinding`, with all the
  permissions needed to manage the Cert-manager resources.


## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 1.11.0         |

## User customization

No customization is strictly needed. The module is ready-to-use in each of its flavors.


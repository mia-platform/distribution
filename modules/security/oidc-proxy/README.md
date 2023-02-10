# OIDC Proxy Module

The OIDC Proxy is a reverse proxy for Kubernetes authentication via and external provider using the OIDC standard,
that can be used when you cannot setup the api-server directly, like with managed kubernetes services like GKE, AKS etc.

The module is using the forked version mantained by Tremolo Security but the original work has been done by JetStack.

[Here is the link to official repository.](https://github.com/TremoloSecurity/kube-oidc-proxy/)

## What the base module contains

- **Dex:**
  - **Configs:** configurations for dex identity provider
  - **Workload:** deployment and service for dex
  - **RBAC:** `ServiceAccount`, `ClusterRole`, `ClusterRoleBinding`, `Role` and `RoleBinding` needed by Dex
- **Resources:**
  - **Configs:** configurations for oidc-proxy
  - **Controller:** deployment and service for oidc-proxy
  - **RBAC:** `ServiceAccount`, `ClusterRole`, `ClusterRoleBinding`, `Role` and `RoleBinding` needed by odic-proxy
- **Patches:** patches need for working with the automatic certificate generator

## Flavors

## Base

In this flavor in addition to the proxy we will deploy an internal instance of dex that you can use for testing
porpuse and is not intended for production use. Even if you want to deploy it with dex we reccomend to use the
`external-oidc` flavor and configure it to use your hardened and production ready dex deployment.

## External OIDC

In 99% of your usage you likely need this flavor; it will drop Dex as an internal provider for allowing you to
specify the external one you would like to use for authenticating in your cluster.

## Compatibility Matrix

| Module Version | Tool Version                           |
|----------------|----------------------------------------|
| 1.24.0         | latest@3b623f33c (no semver available) |

## User customization

In the `external-oidc` flavor we expect that a secret named `oidc-config` is created in the same namespace of the
deployment and that contains at least this keys:

- oidc.client-id
- oidc.issuer-url
- oidc.username-claim
- oidc.groups-claim

The values of the keys depends on your provider and its documentation. Additionally if your provider is expesed
with a certificate firmed by a private CA you can patch the deployment with a volume that contains it and
patching the path inside the env variabile named `OIDC_CA_FILE_PATH`.

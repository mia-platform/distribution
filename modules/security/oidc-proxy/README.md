# OIDC Proxy Module

The OIDC Proxy is a reverse proxy for Kubernetes authentication via an external provider using the OIDC standard.  
It can be used when you cannot set up the API server directly, like with managed Kubernetes services such as
GKE, AKS, etc.

The module is using the forked version mantained by Tremolo Security but the original work has been done by JetStack.

[Here is the link to official repository].

The module will install the `kube-oidc-proxy` deployment and the Dex idp provider for local testing, for a production
setup we will reccomend to use the external-oidc flavor.

## Module Contents

- **[dex](./dex)**: contains resources and patches for setting up the Dex idp for local testing
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the base configurations for the service, including the `Namespace`
		and `NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[oidc-proxy](./base/resources/workloads/oidc-proxy):** resources for the kube-oidc-proxy workloads and its
			configurations

## Module Configurations

The module will install all its component inside the `oidc-proxy` namespace and will use the following
default **ports**:

- kube-oidc-proxy:
  - **11280** expose the proxy endpoint
  - **11281** expose the readiness probe
- dex:
  - **11282** expose the idp endpoint

This module use the following user, gid and fsGroup:

- kube-oidc-proxy: **48080**
- dex: **48081**

## Flavors

## Base

In this flavor, in addition to the proxy, we will deploy an internal instance of dex that you can use for testing
purposes and is not intended for production use. Even if you want to deploy it with dex we recommend using the
`external-oidc` flavor and configuring it to use your hardened and production-ready dex deployment.

## External OIDC

In 99% of cases you likely need this flavor; it will drop Dex as an internal provider allowing you to
specify the external one you would like to use for authenticating in your cluster.

## Compatibility Matrix

| Module Version | kube-oidc-proxy Version                | Dex Version |
|----------------|----------------------------------------|-------------|
| 1.24.x         | latest@22c421886 (no semver available) | 2.36.0      |
| 1.25.x         | latest@169cccafa (no semver available) | 2.36.0      |
| 1.26.0         | latest@51bda58e2 (no semver available) | 2.36.0      |
| 1.26.1         | latest@5f75e4377 (no semver available) | 2.37.0      |
| 1.26.2         | 1.0.6-21733e                           | 2.39.0      |
| 1.27.0         | latest@b0aedbe3e (no semver available) | 2.37.0      |
| 1.27.1         | latest@0e0ffbcc9 (no semver available) | 2.37.0      |
| 1.27.2         | 1.0.6-21733e                           | 2.39.0      |
| 1.27.3         | 1.0.6-4c7812                           | 2.39.1      |
| 1.27.4         | 1.0.6-0dce34                           | 2.40.0      |
| 1.27.5         | 1.0.6-89eb8d                           | 2.40.0      |
| 1.28.0         | 1.0.6-1896b9                           | 2.39.1      |
| 1.28.1         | 1.0.6-4c7812                           | 2.39.1      |
| 1.28.2         | 1.0.6-0dce34                           | 2.40.0      |
| 1.28.3         | 1.0.6-89eb8d                           | 2.40.0      |
| 1.28.4         | 1.0.6-f1a6c3                           | 2.41.1      |
| 1.29.0         | 1.0.6-f1a6c3                           | 2.41.1      |
| 1.29.x         | 1.0.6-e24311                           | 2.41.1      |

## User customization

In the `external-oidc` flavor we expect that a secret named `oidc-config` is created in the same namespace of the
deployment and that contains at least this keys:

- oidc.client-id
- oidc.issuer-url
- oidc.username-claim
- oidc.groups-claim

The values of the keys depend on your provider and its documentation. Additionally, if your provider is exposed
with a certificate firmed by a private CA, you can patch the deployment with a volume that contains it and
patching the path inside the env variable named `OIDC_CA_FILE_PATH`.

[Here is the link to official repository]: https://github.com/TremoloSecurity/kube-oidc-proxy
	"kube-oidc-proxy GitHub Repository"

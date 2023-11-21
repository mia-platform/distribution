# cert-manager Module

`cert-manager` is an operator that manages the request and issuing of X.509 certificates on a Kubernetes cluster.
With `cert-manager` you can define certificate issuers, check the status of the certificates already present and
renew them.

[Here is the link to the official repository].

The module will install the three deployments that compose the operator and will add to the admin, editor and view
ClusterRoles the appropiate permissions to handle the CRDs that the operator will install.

## Module Contents

- **[crds](./base/crds)**: `cert-manager` custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** `Namespace` of the module and the base deny all `NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[cainjector](./base/resources/workloads/cainjector):** resources for the ca-injector workload. It’s the component
				that helps to configure the CA certificates for: Mutating Webhooks, Validating Webhooks Conversion Webhooks
				and API Services
    - **[cert-manager](./base/resources/workloads/cert-manager):** resources for the main cert-manager workload. It’s the
				component that handle the certificates lifecycle
    - **[webhook](./base/resources/workloads/webhook):** resources for the webhook workload. It’s the component that
				expose the Dynamic Admission Control functionality for validating, mutating  and converting the `cert-manager`
				CRDs

## Module Configurations

The module will install all its component inside the `cert-manager-system` namespace and will use the following
default **ports**:

- cert-manager cainjector
  - **none**
- cert-manager controller
  - **11200** for exposing the metrics endpoint
- cert-manager webhook
  - **11201** for exposing the webhook endpoint, the api-server must reach this port for avoiding timeout errors on
		CRDs creation
  - **11202** expose the health probe endpoint for kubernetes

This module use the following user, gid and fsGroup:

- cert-manager cainjector: **48000**
- cert-manager controller: **48001**
- cert-manager webhook: **48002**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.x         | 1.11.0         |
| 1.25.x         | 1.11.4         |
| 1.26.0         | 1.12.3         |
| 1.26.1         | 1.12.4         |
| 1.26.2         | 1.12.6         |
| 1.27.x         | 1.13.2         |

## User customization

After the installation a cluster operator may want to setup one or more ClusterIssuer if needed or leave the setup
of Issuers and Certificates to the admin and/or editor of the cluster for their namespaces. The modules will add
the necessary additon to the default roles, but if you are using custom ones you must update them for adding
the relevant permissions on the new CRDs that the module will install.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to reach the
port that the webhook service expose.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `networkHost`
option of the webhook pod to `true` for allowing the api-server to reach its endpoint.

[Here is the link to the official repository]: https://github.com/cert-manager/cert-manager
	"cert-manager GitHub Repository"

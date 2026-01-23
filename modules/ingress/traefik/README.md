# Traefik Module

Traefik is a popular open-source reverse proxy and load balancer for microservices.  
The Traefik ingress controller allows you to route traffic to your Kubernetes services and secure them with TLS
encryption and other features.

[Here is the link to Traefik official repository].

The module will install the deployment, ingress class, and will add the correct permissions to operate
on the installed CRDs for the builtin `admin`, `edit` and `view` ClusterRoles.

The NetworkPolicy applied to the traefik workload will explicitly deny exposing services that will run in the following
namespaces for added security:

- `default`
- `kube-node-lease`
- `kube-system`

If you **absolutely** need to expose workloads that are in one of this namespace please add a specific allow that will
match only those pods.

## Module Contents

- **[crds](./base/crds)**: `traefik` custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the configurations for the service, including the `Namespace` and
			`NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[traefik](./base/resources/workloads/traefik):** resources for the traefik controller

## Module Configurations

The module will install all its component inside the `ingress-system` namespace and will use the following
default **ports**:

- traefik:
  - **11240** for exposing the plain http traffic
  - **11241** for exposing the https traffic
  - **11242** for exposing the internal traefik dashboard and metric endpoint

This module use the following user, gid and fsGroup:

- traefik: **48040**

## Flavors

The modules comes with three additional flavors that will add minimal configurations needed for different flavor of
Kubernetes:

### AKS

- replaces the Traefik service type From `NodePort` to `LoadBalancer`

### EKS

- replaces the Traefik service type From `NodePort` to `LoadBalancer`
- sets the `service.beta.kubernetes.io/aws-load-balancer-type` to `nlb` in Traefik service

### GKE

- replaces the Traefik service type From `NodePort` to `LoadBalancer`

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.34.0         | 3.6.6          |
| 1.34.1         | 3.6.7          |

## User customization

After the installation a namespace `admin` or `edit` may want to add the correct resources for exposing one or more
endpoints for their microservices.  
Additionally a `cluster-admin` can add a `default` `TLSStore` and `TLSOptions` resource with the default configurations
that the secure connection must have if the user will not specify nothing in their `IngressRoutes`.

## GKE User

You can set a fixed `LoadBalancerIP` if you want using a patch targeting the Service with the
`distribution.mia-platform.eu/service-type` annotation set to `ingress` for adding the field with a custom value.
In doing so you will force GCP to use that specific IP when is creating the Cloud Load Balancer resource, if it is
available and you have already reserved it.

## EKS User

You can use the `service.beta.kubernetes.io/aws-load-balancer-eip-allocations` annotation to the LoadBalancer service
to specify a series of ARN for selecting Elastc IPs that you want to attach to the load balancer created.

[Here is the link to traefik official repository]: https://github.com/traefik/traefik "Traefik GitHub Repository"

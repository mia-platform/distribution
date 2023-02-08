# Traefik Module

Traefik is a popular open-source reverse proxy and load balancer for microservices.
The Traefik ingress controller allows you to route traffic to your Kubernetes services and secure them with TLS
encryption and other features.

[Here is the link to Traefik official repository.](https://github.com/containous/traefik)

## What the base module contains

- **CRDs:** Traefik custom resource definitions
- **Resources (Traefik ingress):**
  - **Configs:** configurations of related resources (e.g. namespace, network policies, etc.)
  - **Controller:** deployments and services for Traefik ingress and its dashboards
  - **RBAC:** service account, `ClusterRole` and `ClusterRoleBinding`, with all the
  permissions needed to manage Traefik resources

## Flavors

### AKS

- Replaces the Traefik service type From `NodePort` to `LoadBalancer`.

### EKS

- Replaces the Traefik service type From `NodePort` to `LoadBalancer`.
- Sets the `service.beta.kubernetes.io~1aws-load-balancer-type` to `nlb` in Traefik service.

### GKE

- Replaces the Traefik service type From `NodePort` to `LoadBalancer`.

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 2.9.6          |

## User customization

No customization is strictly needed. The module is ready-to-use in each of its flavors.

### GKE

If you wish to change the IP of the load balancer, you can do so by adding the
`LoadBalancerIP` as a Kustomization patch and set it to the target IP.

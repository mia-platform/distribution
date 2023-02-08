# Traefik Module

Traefik is a popular open-source reverse proxy and load balancer for microservices.
The Traefik ingress controller allows you to route traffic to your Kubernetes services and secure them with TLS
encryption and other features.

[Official Traefik repository](https://github.com/containous/traefik)

## What the base module contains

- **CRDs**:
  - IngressRoutes
  - IngressRouteTCPs
  - IngressRouteUDPs
  - Middlewares
  - MiddlewareTCPs
  - ServersTransports
  - TLSOptions
  - TLSStores
  - TraefikServices
- **Resources**
  - **Ingress controller**: deployments and services for Traefik ingress and its dashboards
  - **RBAC**: service account, clusterrole and binding, with all the permissions needed to manage Traefik resources

## Flavors

### AKS

The Traefik service type is set to `LoadBalancer` instead of `NodePort`.

### EKS

The Traefik service type is set to `LoadBalancer` instead of `NodePort`, and it is configured
to work as a Network Load Balancer (NLB).

### GKE

Replaces the service type From `NodePort` to `LoadBalancer`.

## Compatibility Matrix

## Custom configurations

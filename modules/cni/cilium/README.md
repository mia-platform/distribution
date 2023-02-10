# Cilium Module

Cilium is a cloud-native solution that provides network connectivity.
The Cilium module configures the *Container Network Interface* (CNI) necessary to implement the *Kuberentes network model* of your cluster.

[Here is the link to Cilium official repository.](https://github.com/containous/traefik)

## What the base module contains

- **Resources (Traefik ingress):**
  - **Cilium-agent:** RBAC and definitions of the Cilium-agent deamonset.
  - **Cilium-operator:** RBAC and definitions of the Cilium-operator deployments.
  - **Configs:** configmap with the necessary configurations of Cilium.
  - **Hubble** RBACs and workloads for the Hubble observability platform.

## Flavors

### EKS

- Adds `egress-masquerad-interfaces: eth0` in the Cilium config.

Note: When using this module, it is expected that the AWS CNI Daemonset is disabled in the cluster

### GKE

- Deploys the `node-init` daemonset with the correspoing RBACs. 
- Changes to the `cilium-config` configmap:
  - `tunnel: disabled`
  - `enable-endpoint-routes: true`
  - `enable-local-route: false`
  - `ipam: kubernetes`
  - `cluster-pool-ipv4-cidr` removed  
  - `cluster-pool-ipv4-mask-size` removed
- Changes the path `/opt/cni/bin` to `/home/kubernetes/bin` in the Daemonsets.

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 1.12.6         |

## User customization

### Base, EKS
In the `cilium-config` configmap:
- `ipv4-native-routing-cidr`: Set up your pods' CIDR. By default this value is `10.10.0.0/16`

### GKE
In the `cilium-config` configmap:
- `ipv4-native-routing-cidr`: Set up your pods' CIDR. It needs to be initialized with the pod cidr selected in cluster creation.
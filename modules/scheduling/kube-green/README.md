# kube-green Module

Kube-green is a Kubernetes controller that that automatically shuts down (some of) your resources when you
don’t need them.

[Here is the link to Kube-green official repository].

The module will install the deployment, and will add the correct permissions to operate
on the installed CRDs for the builtin `admin`, `edit` and `view` ClusterRoles.

## Module Contents

- **[crds](./crds)**: `kube-green` custom resource definitions
- **[resources](./resources)**:
  - **[configs](./resources/configs):** contains the configurations for the service, including the `Namespace` and
			`NetworkPolicy`
  - **[RBAC](./resources/rbac):** RBAC resources for the workload and for adding capabilitis to the default ClusterRoles
  - **[workloads](./resources/workloads):**
    - **[kube-green](./resources/workloads/kube-green):** resources for the kube-green controller

## Module Configurations

The module will install all its component inside the `kube-green-system` namespace and will use the following
default **ports**:

- kube-green:
  - **11230** for exposing the webhook endpoint, the api-server must reach this port for avoiding timeout errors on
		CRDs creation
  - **11231** for exposing the metrics endpoint
  - **11232** expose the health probe endpoint for kubernetes

This module use the following user, gid and fsGroup:

- kube-green: **48030**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.x         | 0.5.0          |
| 1.25.x         | 0.5.1          |

## User customization

After the installation a namespace `admin` or `edit` may want to add `SleepInfo` to their namespaces for setting
schedule where unused workloads can be turned off to free up resources.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to
reach the webhook port.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `networkHost`
option of deployment to `true` for allowing the api-server to reach its endpoint.

[Here is the link to Kube-green official repository]: "https://github.com/kube-green/kube-green" "kube-green GitHub Reository"

# Kyverno Module

Kyverno is a Kubernetes policy manager that leverages CRDs to enforce policies at the cluster or namespace level.  
These policies filter what is being deployed, and ensure that they meet the defined security specifications or that
some functionalities are restricted.  
Kyverno can also patch resources at apply time or generate them from scratch in order to automate certain features
or ensure that necessary fields are automatically compiled.

[Here is the link to the official repository].

The module will install one deployment with the Kyverno controller, and will add the correct permissions to operate
on the installed CRDs for the builtin `admin` ClusterRole.

## Module Contents

- **[crds](./crds)**: `kyverno` custom resource definitions
- **[resources](./resources)**:
  - **[configs](./resources/configs):** contains the configurations for the service, including the `Namespace`,
		`NetworkPolicy` and `PodDistruptionBudget` resources
  - **[RBAC](./resources/rbac):** RBAC resources for the workload and for adding capabilitis to the default ClusterRole
  - **[workloads](./resources/workloads):**
    - **[kyverno](./resources/workloads/kyverno):** resources for the kyverno main controller. This component will
				manage the main policies for security and resource generation of the cluster
    - **[kyverno-cleanup](./resources/workloads/kyverno-cleanup):** resources for the kyverno cleanup controller.
				This component will manage the cleanup policies for the cluster

## Module Configurations

The module will install all its component inside the `kyverno-system` namespace and will use the following
default **ports**:

- kyverno:
  - **9443** it cannot be changed for now and is the port that expose the webhook functionality
  - **11210** expose the metrics for the service
  - **11211** expose the profile information for the service
- kyverno-cleanup:
  - **9443** it cannot be changed for now and is the port that expose the webhook functionality
  - **11212** expose the metrics for the service
  - **11213** expose the profile information for the service

This module use the following user, gid and fsGroup:

- kyverno: **48010**
- kyverno-cleanup: **48011**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.x         | 1.9.1          |
| 1.25.x         | 1.9.5          |

## User customization

After the installation a cluster operator or a namespace admin may want to setup `Policies` or `ClusterPolicies`
for allowing, denying or modifying resource applied to the cluster or namespace for meeting regulatory or security
profiles.  
To view some examples, you can explore the [kyverno policies repository] or check them in the official [documentation]
site.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to
reach the webhook port.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `networkHost`
option of deployment to `true` for allowing the api-server to reach its endpoint.

[Here is the link to the official repository]: https://github.com/kyverno/kyverno "Kyverno GitHub Repository"
[kyverno policies repository]: https://github.com/kyverno/policies "Kyverno Policies GitHub Repository"
[documentation]: https://kyverno.io/policies/ "Kyverno Policies Site"

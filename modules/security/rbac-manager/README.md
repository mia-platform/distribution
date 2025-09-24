# RBAC Manager Module

RBAC Manager is a kuberentes controller that simplify the configurations of RBAC resources and even
aid in the automatization by constantly keeping in sync its resources with the cluster state.

[Here is the link to the official repository].

The module will install the controller deployment and its CRDs.

## Module Contents

- **[crds](./base/crds)**: RBAC Manager custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the base configurations for the service, including the `Namespace`
		and `NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[rbac-manager](./base/resources/workloads/rbac-manager):** resources for the rbac-manager controller. This component
			will manage the correct handling of the `RBACDefinition` installed in the cluster

## Module Configurations

The module will install all its component inside the `rbac-manager-system` namespace and will use the following
default **ports**:

- rbac-manager:
  - **11220** expose the metrics for the service

This module use the following user, gid and fsGroup:

- rbac-manager: **48020**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.33.0         | 1.9.2          |
| 1.33.1         | 1.9.3          |

## User customization

After the installation a cluster operator may want to setup a set of `RBACDefinitions` for automate the creation of
`ClusterRoleBindings`, `RoleBindings`, and `ServiceAccounts` with the appropriate logic for its use case.

[Here is the link to the official repository]: https://github.com/FairwindsOps/rbac-manager "RBAC Manager GitHub Repository"

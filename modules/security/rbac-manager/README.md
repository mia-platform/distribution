# RBAC Manager Module

RBAC Manager is a kuberentes controller that simplify the configurations of RBAC resources and even
aid in the automatization by constantly keeping in sync its resources with the cluster state.

[Here is the link to official repository.](https://github.com/FairwindsOps/rbac-manager)

## What the base module contains

- **CRDs:** RBAC Manager custom resource definitions
- **Resources:**
  - **Configs:** network policies for RBAC Manager
  - **Workload:** the controller deployment
  - **RBAC:** the `ServiceAccount`, `ClusterRole` and `ClusterRoleBinding` needed by the controller

## Flavors

This module has no flavors.

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 1.4.2          |

## User customization

No customizations are needed for the module to correctly operate.

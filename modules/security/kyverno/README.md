# Kyverno Module

Kyverno is a Kubernetes policy manager, that via the use of CRDs can enforce policies at cluster or namespace
level to control what is been deployed and ensuring that certain level of security is meet or that some
functionality are restricted.  
It also allow for changing resources during apply time or generating new resources for automating certain feature
or ensuring that certain fields are automatically compiled.

[Here is the link to official repository.](https://github.com/kyverno/kyverno)

## What the base module contains

- **CRDs:** Kyverno custom resource definitions
- **Resources:**
  - **Configs:** configuration and network policies for Kyverno
  - **Workload:** the kyverno deployment and service for exposing the generated webhooks
  - **RBAC:** `ServiceAccount`, `ClusterRole`, `ClusterRoleBinding` `Role` and `RoleBinding` needed by kyverno,
		some of the `ClusterRole`s will be aggregated in the `admin` one for allowing users that bind to it to operate
		on them

## Flavors

This module has no flavors

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 1.8.5          |

## User customization

No customization is needed, you have to create your `Policies` or `ClusterPolicies` to apply to your cluster,
a good start is to explore the [kyverno policies repository](https://github.com/kyverno/policies) or explore them
in the [documentation](https://kyverno.io/policies/).

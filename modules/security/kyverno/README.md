# Kyverno Module

Kyverno is a Kubernetes policy manager that leverages CRDs to enforce policies at cluster or namespace level. These policies filter what is been deployed and ensure that they meet the defined security specifications or that some functionality are restricted.  
Kyverno can also patch resources at apply time or generate them from scratch in order to automate certain features
or ensure that necessary fields are automatically compiled.

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

No customization is needed to use Kyverno, you can start by defining your `Policies` or `ClusterPolicies` and apply them your cluster.
To view some examples, you can explore the [kyverno policies repository](https://github.com/kyverno/policies) or check them in the [documentation](https://kyverno.io/policies/).

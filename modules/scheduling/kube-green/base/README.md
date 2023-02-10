# Traefik Module

Kube-green is a Kubernetes addon that allows you to shut down the workloads you don't need with the definition of *schedules*.

[Here is the link to Kube-green official repository.]

## What the base module contains

- **CRDs:** Kube-green custom resource definitions
- **Resources:**
  - **Configs:** configurations of related resources.
  - **Workload:** deployments and services for Kube-green controller and its service
  - **RBAC:** The necessary service account, `ClusterRole` and `ClusterRoleBinding`.

## Flavors

This module has no flavors

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 0.4.0          |

## User customization

No customization is strictly needed. The module is ready-to-use in each of its flavors.


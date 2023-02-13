# Prometheus Operator Module

The Quay.io Prometheus Operator is an open-source tool that helps you manage Prometheus instances in your Kubernetes cluster.
It automates the deployment of Prometheus, Alertmanager, and other components, and provides
an easy way to monitor and alert on your cluster resources and custom applications.

[Here is the link to Logging Operator official repository.](https://quay.io/prometheus-operator)

## What the base module contains

- **CRDs:** Prometheus Operator custom resource definitions
- **Resources:**
  - **Configs:** configurations of related resources (namespace, network policies)
  - **Kube State Metrics:** configurations, deployment, and RBAC definitions for the Kube State Metrics
  - **Node Exporter:** configurations, daemonset, and RBAC definitions for the Node Exporter
  - **Prometheus Operator:** configurations, deployment, service, and RBAC definitions for the Prometheus Operator

## Compatibility Matrix

| Module Version | Prometheus Operator   | Node Exporter | Kube State Metrics |
|----------------|-----------------------|---------------|--------------------|
| 1.24.0         | 0.62.0	      			   | 1.5.0         | 2.7.0              |

## User customization

No customization is strictly needed. The module is ready-to-use.

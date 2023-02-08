# Logging Operator Module

The Banzai Cloud Logging Operator is an open-source tool that helps you manage logging
resources in your Kubernetes cluster. It automates the deployment of popular logging tools
such as Fluentd, Elasticsearch, and Kibana, and provides a unified logging solution for your cluster.

[Here is the link to Logging Operator official repository.](https://github.com/banzaicloud/logging-operator)

## What the base module contains

- **CRDs:** Logging Operator custom resource definitions
- **Resources (Logging Operator):**
  - **Configs:** configurations of related resources (namespace, network policies)
  - **Controller:** Logging Operator deployment
  - **RBAC:** service account, `ClusterRole` and 'ClusterRoleBinding', with all the
  permissions needed to manage the Logging Operator resources

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.0         | 3.17.10	      |

## User customization

No customization is strictly needed. The module is ready-to-use.

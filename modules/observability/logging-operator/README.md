# Logging Operator Module

The Logging Operator is an open-source tool that helps you manage logging resources in your Kubernetes cluster.
It manages the deployment of a fluentbit-fluentd stack that can be configured to send logs to other services
like Elasticsearch, Loki, Sumologic, etc., providing a unified logging solution for your cluster.

[Here is the link to Logging Operator official repository].

The module will install the logging-operator deployment, its CRDs, and the correct permissions for the `admin`,
`edit`, and `view` default ClusterRole for operate on them.

## Module Contents

- **[crds](./base/crds)**: Logging Operator custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the configurations for the service, including the `Namespace` and
			`NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
  - **[workloads](./base/resources/workloads):**
    - **[logging-operator](./base/resources/workloads/logging-operator):** resources for the Logging Operator controller

## Module Configurations

The module will install all its component inside the `logging-system` namespace and will use the following
default **ports**:

- logging-operator:
  - **11250** for exposing the metrics endpoint of the controller

This module use the following user, gid and fsGroup:

- logging-operator: **48050**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.24.x         | 4.0.0          |
| 1.25.x         | 4.1.0          |
| 1.26.0         | 4.3.0          |
| 1.26.1         | 4.5.6          |
| 1.27.0         | 4.5.0          |
| 1.27.1         | 4.5.6          |
| 1.28.0         | 4.6.0          |
| 1.28.1         | 4.6.2          |
| 1.29.x         | 4.9.1          |
| 1.30.0         | 4.11.0         |
| 1.30.1         | 4.11.4         |
| 1.31.x         | 5.1.1          |
| 1.32.x         | 5.3.0          |

## User customization

After the installation a cluster admin may want to setup Logging, ClusterOutput, and ClusterFlow for automatically get
logs in the cluster or leave the `admin` and `edit` users to set up Flow and Output for their namespaces indipendently.

[Here is the link to Logging Operator official repository]: https://github.com/kube-logging/logging-operator
	"Logging Operator GitHub Repository"

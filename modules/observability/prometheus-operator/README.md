# Prometheus Operator Module

The Prometheus Operator is an open-source tool that helps you manage Prometheus instances in your Kubernetes cluster.
It automates the deployment of Prometheus, Alertmanager, and other components, and provides
an easy way to monitor and alert on your cluster resources and custom applications.

[Here is the link to the official repository].

The module will install the Prometheus Operator workloads with its CRDs, ClusterRoles that will add to the `edit` and
`view` defautl ClsuterRoles the ability to interact with them, and will also install the [`kube-state-metrics`] and
[Node Exporter] workloads for getting metrics for the actual cluster state, and for the node status.

## What the base module contains

## Module Contents

- **[crds](./crds)**: Prometheus Operator custom resource definitions
- **[resources](./resources)**:
  - **[configs](./resources/configs):** contains the `Namespace` and main deny `NetworkPolicy`
  - **[RBAC](./resources/rbac):** RBAC resources for the workload and for adding capabilitis to the default ClusterRoles
  - **[workloads](./resources/workloads):**
    - **[kube-state-metrics](./resources/workloads/kube-state-metrics):** configurations, deployment, and RBAC
				definitions for `kube-state-metrics`
    - **[node-exporter](./resources/workloads/node-exporter):** configurations, daemonset, and RBAC definitions for
				Node exporter
    - **[prometheus-operator](./resources/workloads/node-exporter):** configurations, deployment, and RBAC definitions
				for Prometheus Operator

## Module Configurations

The module will install all its component inside the `monitoring-system` namespace and will use the following
default **ports**:

- kube-state-metrics:
  - **11260** expose the metrics for the k8s cluster
  - **11261** expose the metrics for the service
- node-exporter:
  - **11262** expose the metrics for the service
- prometheus-operator:
  - **11263** expose the webhook and metrics for the service

This module use the following user, gid and fsGroup:

- kube-state-metrics: **48060**
- node-exporter: **48061**
- prometheus-operator: **48062**

## Compatibility Matrix

| Module Version | Prometheus Operator | Node Exporter | Kube State Metrics |
|----------------|---------------------|---------------|--------------------|
| 1.24.x         | 0.63.0              | 1.5.0         | 2.7.0              |
| 1.25.x         | 0.64.1              | 1.5.0         | 2.7.0              |

## User customization

After the installation a cluster admin may want to create `Prometheus` and `AlertManager` resouces for setting up a
monitoring stack for collecting the metrics exposed inside the cluster, and then an `admin` or `edit` role may want
to create `ServiceMonitor`, `PodMonitor` or `Probe` resources for exposing to the stack one or more metrics endpoint
for their application.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to
reach the webhook port.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `networkHost`
option of deployment to `true` for allowing the api-server to reach its endpoint.

[Here is the link to the official repository]: https://github.com/prometheus-operator/prometheus-operator
	"Prometheus Operator GitHub Repository"
[`kube-state-metrics`]: https://github.com/kubernetes/kube-state-metrics "kube-state-metrics GitHub Repository"
[Node Exporter]: https://github.com/prometheus/node_exporter "Node exporter GitHub Repository"

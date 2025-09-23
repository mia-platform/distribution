# Prometheus Operator Module

The Prometheus Operator is an open-source tool that helps you manage Prometheus instances in your Kubernetes cluster.
It automates the deployment of Prometheus, Alertmanager, and other components, and provides
an easy way to monitor and alert on your cluster resources and custom applications.

[Here is the link to the official repository].

The module will install the Prometheus Operator workloads with its CRDs, ClusterRoles that will add to the `edit` and
`view` defautl ClsuterRoles the ability to interact with them, and will also install the [`kube-state-metrics`] and
[Node Exporter] workloads for getting metrics for the actual cluster state, and for the node status.

## Module Contents

- **[crds](./base/crds)**: Prometheus Operator custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the `Namespace` and main deny `NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
  - **[workloads](./base/resources/workloads):**
    - **[kube-state-metrics](./base/resources/workloads/kube-state-metrics):** configurations, deployment, and RBAC
				definitions for `kube-state-metrics`
    - **[node-exporter](./base/resources/workloads/node-exporter):** configurations, daemonset, and RBAC definitions for
				Node exporter
    - **[prometheus-operator](./base/resources/workloads/node-exporter):** configurations, deployment, and RBAC
			definitions for Prometheus Operator

## Module Configurations

The module will install all its component inside the `monitoring-system` namespace and will use the following
default **ports**:

- kube-state-metrics:
  - **11260** expose the metrics for the k8s cluster
  - **11261** expose the metrics for the service
- node-exporter:
  - **11262** expose the metrics for the service
- prometheus-operator:
  - **11263** expose the metrics for the service
- prometheus-operator-webhook:
  - **11264** expose the webhook and metrics for the service

This module use the following user, gid and fsGroup:

- kube-state-metrics: **48060**
- node-exporter: **48061**
- prometheus-operator: **48062**
- prometheus-operator-webhook: **48065**

## Compatibility Matrix

| Module Version | Prometheus Operator | Node Exporter | Kube State Metrics |
|----------------|---------------------|---------------|--------------------|
| 1.33.x         | 0.85.0              | 1.9.1         | 2.17.0             |

## User customization

After the installation a cluster admin may want to create `Prometheus` and `AlertManager` resouces for setting up a
monitoring stack for collecting the metrics exposed inside the cluster, and then an `admin` or `edit` role may want
to create `ServiceMonitor`, `PodMonitor` or `Probe` resources for exposing to the stack one or more metrics endpoint
for their application.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to
reach the webhook port.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `hostNetwork`
option of deployment to `true` for allowing the api-server to reach its endpoint. You can easily target the correct
workload with the labelSelector `distribution.mia-platform.eu/expose-webhook=true`.

[Here is the link to the official repository]: https://github.com/prometheus-operator/prometheus-operator
	"Prometheus Operator GitHub Repository"
[`kube-state-metrics`]: https://github.com/kubernetes/kube-state-metrics "kube-state-metrics GitHub Repository"
[Node Exporter]: https://github.com/prometheus/node_exporter "Node exporter GitHub Repository"

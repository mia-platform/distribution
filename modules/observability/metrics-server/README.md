# Metrics server Module

Metrics Server is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.
Metrics Server collects resource metrics from Kubelet and exposes them in Kubernetes apiserver through [Metrics API]
for use by [Horizontal Pod Autoscaler] and [Vertical Pod Autoscaler]. Metrics API can also be accessed by `kubectl top`,
making it easier to debug autoscaling pipelines.

[Here is the link to Metrics Server official repository].

The module will install the metrics-server deployment, its APIService and the correct permissions for the default
ClusterRole for operate on them.

## Module Contents

- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the base configurations for the service
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[metrics-server](./base/resources/workloads/metrics-server):** resources for the metrics-server controller. This
			component will collects resource metrics from Kubelet and exposes them in Kubernetes apiserver through Metrics
			API.

## Module Configurations

The module will install all its component inside the `kube-system` namespace and will use the following
default **ports**:

- metrics-server:
  - **11290** for exposing the metrics endpoint of the controller

This module use the following user, gid and fsGroup:

- metrics-server: **48090**

## Flavors

### Secure kubelet

- check TLS validity when connecting to the kubelet

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.33.x         | 0.8.0          |

## User customization

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `hostNetwork`
option of deployment to `true` for allowing the api-server to reach its endpoint. You can easily target the correct
workload with the labelSelector `distribution.mia-platform.eu/expose-webhook=true`.

[Here is the link to Metrics Server official repository]: https://github.com/kubernetes-sigs/metrics-server
	"Metrics Server GitHub Repository"
[Metrics API]: https://github.com/kubernetes/metrics
[Horizontal Pod Autoscaler]: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[Vertical Pod Autoscaler]: https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/

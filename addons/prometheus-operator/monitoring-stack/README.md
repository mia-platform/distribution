# Monitoring Stack for Prometheus Operator

This add-on defines a defautl monitoring stack needed to export the metrics of the cluster.
It configures `Prometheus` and `Alertmanager` custom resources, `NetworkPolicy` for reaching the new stack and for
monitoring all the workloads present in the Prometheus Operator namespace.

## What the Add-On Contains

- **[resources](./resources):**
  - **[alertmanager](./resources/alertmanager):** defines the `Alertmanager` resource with its configurations
  - **[dns-service](./resources/dns-service):** defines the `PodMonitor` resource needed to monitor the cluster
			dns service
  - **[kube-state-metrics](./resources/kube-state-metrics):** defines the `PodMonitor` resource needed to monitor the
			`kube-state-metrics` workload
  - **[kubelet](./resources/kubelet):** defines the `ServiceMonitor` resource needed to monitor the kubelet
  - **[node-exporter](./resources/node-exporter):** defines the `PodMonitor` resource needed to monitor the
			`node-exporter` workloads
  - **[prometheus](./resources/prometheus):** defines the `Prometheus` resource with its configurations
  - **[prometheus-operator](./resources/prometheus-operator):** defines the `PodMonitor` resource needed to track
			the Prometheus Operator workload
  - **[prometheus-operator-webhook](./resources/prometheus-operator-webhook):** defines the `ServiceMonitor` resource
			needed to track the Prometheus Operator Webhook workload

## Add-on Configurations

The add-on will install all its component inside the namespace where the `prometheus-operator` deployement is
and will use the following default **ports**:

- alertmanager:
  - **8080** for exposing the metrics endpoint of the config-reloader sidecar. It cannot be changed
  - **9093** for exposing the web interface of alertmanager and metrics endpoint. It cannot be changed
  - **9094** for exposing the mesh endpoint for building an alertmanager cluster. It cannot be changed
- prometheus:
  - **8080** for exposing the metrics endpoint of the config-reloader sidecar. It cannot be changed
  - **9090** for exposing the web interface of prometheus and metrics endpoint. It cannot be changed

This module use the following user, gid and fsGroup:

- alertmanager: **48063**
- prometheus: **48064**

## Compatibility Matrix

| Add-On Version | Prometheus operator Module Version |
|----------------|------------------------------------|
| 1.0.x          | 1.24.x, 1.25.x, 1.26.x             |
| 2.0.x          | 1.27.x                             |
| 2.1.x          | 1.28.x                             |
| 2.2.x          | 1.29.x                             |
| 2.3.x          | 1.30.x                             |
| 2.4.x          | 1.31.x                             |

## User customization

No customization is needed. The add-on is ready-to-use.

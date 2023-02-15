# Monitoring stack add-on for Prometheus operator

This add-on defines a complete monitoring stack needed to export the metrics of the cluster.
It configures `Prometheus` and `Alertmanager` custom resources, `kube-state-metrics`, `node-exporter` and the `Monitors` that enable harvesting the metrics.

## What the Add-On Contains

**Resurces:**
- **Alertmanager:** Deploys the Alertmanager resource with its configurations.
- **Dns-service:** Deploys the podMonitor resource needed to track the cluster's `dns services`.
- **Kube-state-metrics:** Defines the podMonitor resource needed to track the cluster's `kube*` pods.
- **Kubelet:** Defines the podMonitor resource needed to track the kubelet's services.
- **Node-exporter:** Defines the podMonitor resource needed to track the cluster's `node-exporter` pods.
- **Prometheus:** Deploys the Prometheus resource with its configurations.
- **Prometheus-operator:** Defines the ServiceMonitor needed to track the `prometheus-operator` services.

## Compatibility Matrix

| Add-On Version | Prometheus operator Module Version | 
|----------------|------------------------------------|
| 1.0.0          | 1.24.0                             |

## User customization

No customization is needed

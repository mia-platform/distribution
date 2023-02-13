# Prometheus Operator Resources for cert-manager

This add-on adds support for Prometheus Operator resource for the cert-manager module workloads
To work properly it needs both the Prometheus Operator and Cert Manager module.

## What the Add-On Contains

- **Resources:** the `PodMonitor` resource needed for allowing Prometheus Operator to correctly
	setup Prometheus for scraping the cert-manager workloads and the `NetworkPolicy` for allowing Prometheus to reach
	the exposed port.

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | Cert Manager Module Version |
|----------------|------------------------------------|-----------------------------|
| 1.0.0          | 1.24.0                             | 1.24.0                      |

## User customization

No customization is needed. The add-on is ready-to-use.

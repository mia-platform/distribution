# Prometheus Operator Resources for RBAC Manager

This add-on adds support for Prometheus Operator resource for the RBAC Manager module workloads
To work properly it needs both the Prometheus Operator and RBAC Manager module.

## What the Add-On Contains

- **Resources:** the `PodMonitor` resource needed for allowing Prometheus Operator to correctly
	setup Prometheus for scraping the RBAC Manager workloads and the `NetworkPolicy` for allowing Prometheus to reach
	the exposed port.

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | RBAC Manager Module Version |
|----------------|------------------------------------|-----------------------------|
| 1.0.0          | 1.24.0                             | 1.24.0                      |

## User customization

No customization is needed. The add-on is ready-to-use.

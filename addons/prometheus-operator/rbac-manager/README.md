# Prometheus Operator Resources for RBAC Manager

This add-on adds support for Prometheus Operator resource for the RBAC Manager module workloads.  
To work properly it needs both the Prometheus Operator and RBAC Manager module.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
RBAC Manager controller and the PodMonitor resource for letting the Prometheus Operator to generate the correct
configuration for scraping the data.

## What the Add-On Contains

- **[resources](./resources):** containst the `PodMonitor` and `NetworkPolicy` resources

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | RBAC Manager Module Version |
|----------------|------------------------------------|-----------------------------|
| 1.0.x          | 1.24.0                             | 1.24.0                      |

## User customization

No customization is needed. The add-on is ready-to-use.

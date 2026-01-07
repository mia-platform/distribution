# Prometheus Operator Resources for Kyverno

This add-on adds support for Prometheus Operator resource for the Kyverno module workloads.  
To work properly it needs both the Prometheus Operator and Kyverno module.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
Kyverno controller and the ServiceMonitor resource for letting the Prometheus Operator to generate the correct
configuration for scraping the data.

## What the Add-On Contains

- **[resources](./resources):** contains the `ServiceMonitor` and `NetworkPolicy` resources

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | Kyverno Module Version |
|----------------|------------------------------------|------------------------|
| 1.0.x          | 1.24.x, 1.25.x                     | 1.24.x, 1.25.x         |
| 2.0.x          | >= 1.26.x                          | >= 1.26.x              |

## User customization

No customization is needed. The add-on is ready-to-use.

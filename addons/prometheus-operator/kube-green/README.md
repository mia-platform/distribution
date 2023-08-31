# Prometheus Operator Resources for kube-green

This add-on adds support for Prometheus Operator resource for the kube-green module workloads.  
To work properly it needs both the Prometheus Operator and kube-green module.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
kube-green controller and the ServiceMonitor resource for letting the Prometheus Operator to generate the correct
configuration for scraping the data.

## What the Add-On Contains

- **[resources](./resources):** containst the `ServiceMonitor` and `NetworkPolicy` resources

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | kube-green Module Version |
|----------------|------------------------------------|---------------------------|
| 1.0.x          | 1.24.x, 1.25.x, 1.26.x             | 1.24.x, 1.25.x, 1.26.x    |

## User customization

No customization is needed. The add-on is ready-to-use.

# Prometheus Operator Resources for Traefik

This add-on adds support for Prometheus Operator resource for the Traefik module workloads.  
To work properly it needs both the Prometheus Operator and Traefik module.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
Traefik controller and the ServiceMonitor resource for letting the Prometheus Operator to generate the correct
configuration for scraping the data.

## What the Add-On Contains

- **[resources](./resources):** containst the `ServiceMonitor` and `NetworkPolicy` resources

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | Traefik Module Version |
|----------------|------------------------------------|------------------------|
| 1.0.0          | 1.24.0                             | 1.24.x                 |

## User customization

No customization is needed. The add-on is ready-to-use.

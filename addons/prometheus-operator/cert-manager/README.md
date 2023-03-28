# Prometheus Operator Resources for `cert-manager`

This add-on adds support for Prometheus Operator resource for the cert-manager module workloads.  
To work properly it needs both the Prometheus Operator and Cert Manager module.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
cert-manager controller and the PodMonitor resource for letting the Prometheus Operator to generate the correct
configuration for scraping the data.

## Add-On Contents

- **[resources](./resources):** containst the `PodMonitor` and `NetworkPolicy` resources

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | Cert Manager Module Version |
|----------------|------------------------------------|-----------------------------|
| 1.0.x          | 1.24.0                             | 1.24.x                      |

## User customization

No customization is needed. The add-on is ready-to-use.

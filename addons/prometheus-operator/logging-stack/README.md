# Prometheus Operator Resources for Logging Stack

This add-on adds support for Prometheus Operator resource for the Logging Stack add-on workloads.  
To work properly it needs both the Prometheus Operator and Logging Stack add-on.

The add-on will add the appropriate NetworkPolicy for allowing the comunication between Prometheus and the
Logging stack fluentd and fluentbit resources, and the SerciceMonitor resources for letting the Prometheus Operator
to generate the correct configuration for scraping the data.

## What the Add-On Contains

- **[resources](./resources):**
  - **[configs](./resources/fluentbit):** contains the `ServiceMonitor` and `NetworkPolicy` resource for fluentbit
  - **[configs](./resources/fluentd):** contains the `ServiceMonitor` and `NetworkPolicy` resource for fluentd

## Compatibility Matrix

| Add-On Version | Prometheus Operator Module Version | Logging Stack Add-on Version |
|----------------|------------------------------------|------------------------------|
| 1.0.x          | 1.24.x, 1.25.x, 1.26.x             | 1.0.x,                       |
| 2.0.x          | 1.24.x, 1.25.x, 1.26.x             | 2.0.x,                       |

## User customization

No customization is needed. The add-on is ready-to-use.

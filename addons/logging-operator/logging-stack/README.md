# Logging system for Logging operator

This add-on defines default `Logging` and `FluentbitAgent` resources for the Logging Opeartor that will
create a `fluent-bit` and `fluentd` stack with the appropriate NetworkPolicy for communicating between them
and an eventual external system for the LTS storage of the logs. To work properly it needs the Logging Operator module.

The resource is set to allow Cluster resources only in the same namespace of the Logging Operator workload and all RBAC
resources are created manually.

## What the Add-On Contains

- **[resources](./resources):** containst the `Logging`, `FluentbitAgent` and `NetworkPolicy` resources

## Add-on Configurations

The add-on will install all its component inside the `logging-system` namespace and will use the following
default **ports**:

- fluentbit:
  - **11251** for exposing the metrics endpoint
- fluentd:
  - **24240** forwarder listening port, it cannot be changed from this value
  - **24444** fluentd port for reloading config, exposed on localhost it cannot be changed from this value
  - **11253** for exposing the metrics endpoint

This module use the following user, gid and fsGroup:

- fluentbit: user **0**, for reading files on nodes, **48051** for group and fsGroup
- fluentd: **48052**

## Compatibility Matrix

| Add-On Version | Logging Operator Module Version |
|----------------|---------------------------------|
| 1.0.x          | 1.24.x, 1.25.x                  |
| 2.0.x          | 1.26.x                          |

## User customization

No customization is needed. The add-on is ready-to-use.

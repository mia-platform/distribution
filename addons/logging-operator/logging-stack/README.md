# Logging system for Logging operator 

This add-on defines and deploys the logging stack of the Logging operator. It consists of the necessary `FluentD` and `FluentBit` configurations. 
To work properly it needs the Logging Operator module.

## What the Add-On Contains

**Resurces:**
- **Logging:** Logging CRD that defines configurations for FluentD and FluentBit.
- **Network policies:** Network policy needed to allow traffic for FluentBit.

## Compatibility Matrix

| Add-On Version | Logging Operator Module Version |
|----------------|---------------------------------|
| 1.0.0          | 1.24.0                          |

## User customization

No customization is needed. The add-on is ready-to-use.
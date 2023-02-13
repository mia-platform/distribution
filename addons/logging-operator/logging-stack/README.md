# Logging system for Logging operator 

This add-on define and deploys the logging system of the Logging operator. It consists of the necessary `FluentD` and `FluentBit` configurations. 

## What the Add-On Contains

**Resurces:**
- **Logging:** Logging operator's CRD that define configurations fot FluentD and FluentBit.
- **Networkpolicies:** Networkpolicy neede to allow traffic for FluentBit.

## Compatibility Matrix

| Add-On Version | Cert Manager Module Version | kube-green Module Version |
|----------------|-----------------------------|---------------------------|
| 1.0.0          | 1.24.0                      | 1.24.0                    |

## User customization

No customization is needed

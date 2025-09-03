# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.33.0

### Changed

- update traefik to v3.5.1

## v1.32.4

### Changed

- update traefik to v3.4.5

## v1.32.3

### Fixed

- wrong CEL validation for ServersTransport and ServersTransportTCP CRDs

## v1.32.2

### Changed

- update traefik to v3.4.4

### Fixed

- missing permission for Kubernetes Ingress resources

## v1.32.1

### Changed

- update traefik to v3.4.3

## v1.32.0

### Changed

- removed deprecated enforce-mountable-secrets annotation
- update traefik to v3.4.1

## v1.31.4

### Fixed

- network policy for UDP incoming traffic

## v1.31.3

### Changed

- update traefik to v3.3.7

## v1.31.2

### Changed

- update traefik to v3.3.5

## v1.31.1

### Changed

- update traefik to v3.3.4
- disable http3 by default on EKS flavor because the default load balancer cannot support it for now

### Fixed

- http3 exposed port
- separate service between protocols for GKE and AKS flavors

## v1.31.0

### Changed

- update traefik to v3.3.3

### Added

- support for http3

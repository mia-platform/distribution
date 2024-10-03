# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.29.1

### Changed

- update traefik to v3.1.5

## v1.29.0

### Changed

- update traefik to v3.1.2

### Added

- support for the new Kubernetes Gateway API v1.1 resources

## v1.28.3

### Changed

- update traefik to v2.11.8

## v1.28.2

### Changed

- update traefik to v2.11.6

## v1.28.1

### Changed

- update traefik to v2.11.3

## v1.28.0

### Changed

- update traefik to v2.11.2
- traefik server now bind the pod ip and not all network interfaces

## v1.27.5

### Changed

- update traefik to v2.11.6

## v1.27.4

### Changed

- update traefik to v2.11.3

## v1.27.3

### Changed

- update traefik to v2.11.2

## v1.27.2

### Changed

- use `traefik.io` Group for internal dashboard IngressRoute

## v1.27.1

### Changed

- update traefik to v2.11.0
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

### Changed

- update traefik to v2.10.7
- removed status section from the CRDs
- changed pdb minimum availability from 1 to 25% for better default with a great number of replicas

## v1.26.2

### Changed

- update traefik to v2.11.0
- removed status section from the CRDs

## v1.26.1

### Changed

- update traefik to 2.10.5

## v1.26.0

### Changed

- update traefik to 2.10.4

## v1.25.1

### Changed

- update traefik to 2.10.3

## v1.25.0

### Changed

- update traefik to 2.10.1

## v1.24.1

### Fixed

- aggregation to `admin`, `edit` and `view` cluster roles

## v1.24.0

- First Release

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.31.1

### Changed

- update cert-manager to 1.17.2

## v1.31.0

### Changed

- update cert-manager to 1.17.1

## v1.30.4

### Changed

- update cert-manager to 1.16.5

## v1.30.3

### Changed

- update cert-manager to 1.16.4

## v1.30.2

### Changed

- update cert-manager to 1.16.3

## v1.30.1

### Changed

- update cert-manager to 1.16.2

## v1.30.0

### Changed

- update cert-manager to 1.16.1
- update PodDisruptionBudget from minAvailable to maxUnavailable

## v1.29.2

### Changed

- update cert-manager to 1.15.5

## v1.29.1

### Changed

- update cert-manager to 1.15.4

## v1.29.0

### Changed

- update cert-manager to 1.15.3

### Added

- support for Gateway API objects

## v1.28.3

### Changed

- update cert-manager to 1.14.7

## v1.28.2

### Changed

- update cert-manager to 1.14.6

## v1.28.1

### Changed

- update cert-manager to 1.14.5

## v1.28.0

### Changed

- update cert-manager to 1.14.4
- cert-manager controller now bind the pod ip and not all network interfaces

## v1.27.3

### Changed

- update cert-manager to 1.13.6

## v1.27.2

### Changed

- update cert-manager to 1.13.5

## v1.27.1

### Changed

- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- bindings for Openshift cluster-view cluster role

### Changed

- update cert-manager to 1.13.3
- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

## v1.26.4

### Changed

- update cert-manager to 1.12.9

## v1.26.3

### Fixed

- wrong sha for cert-manager-acmesolver image

## v1.26.2

### Changed

- update cert-manager to 1.12.6

## v1.26.1

### Changed

- update cert-manager to 1.12.4

## v1.26.0

### Changed

- update cert-manager to 1.12.3

## v1.25.1

### Changed

- update cert-manager to 1.11.4

## v1.25.0

### Changed

- update cert-manager to 1.11.1

## v1.24.1

### Fixed

- aggregation to `admin`, `edit` and `view` cluster roles
- egress network policy for cert-manager controller

## v1.24.0

- First Release

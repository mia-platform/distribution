# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- update rbac-manager to v1.9.2

## v1.31.0

- no changes

## v1.30.0

- no changes

## v1.29.0

### Changed

- update rbac-manager to v1.9.0

## v1.28.0

### Changed

- rbac-manager server now bind the pod ip and not all network interfaces

## v1.27.1

### Changed

- update rbac-manager to v1.8.0
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- bindings for Openshift cluster-view cluster role

### Changed

- update rbac-manager to v1.7.0
- add nodeSelector for all workloads to ensure that they will run only on linux nodes

### Removed

- PodDistruptionBudget, no intention on supporting multiple replicas from maintainers because HA is not needed
	the budget will only impact on node drainage during mantainance

## v1.26.2

### Changed

- update rbac-manager to v1.8.0

## v1.26.1

### Changed

- update rbac-manager to v1.6.5

## v1.26.0

### Changed

- update rbac-manager to v1.6.4

## v1.25.1

### Changed

- reference the image version with also the @digest

## v1.25.0

### Changed

- update rbac-manager to v1.5.0

## v1.24.0

- First Release

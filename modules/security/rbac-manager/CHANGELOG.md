# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- bindings for Openshift cluster-view cluster role

### Changed

- update rbac-manager to v1.7.0

### Removed

- PodDistruptionBudget, no intention on supporting multiple replicas from maintainers because HA is not needed
	the budget will only impact on node drainage during mantainance

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

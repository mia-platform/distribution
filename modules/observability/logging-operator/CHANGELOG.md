# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- update logging-operator to v5.3.0

## v1.31.0

### Changed

- update logging-operator to v5.1.1

## v1.30.1

### Changed

- update logging-operator to v4.11.4

## v1.30.0

### Changed

- update logging-operator to v4.11.0
- update PodDisruptionBudget from minAvailable to maxUnavailable

## v1.29.0

### Changed

- update logging-operator to v4.9.1

## v1.28.1

### Changed

- update logging-operator to v4.6.2

## v1.28.0

### Changed

- update logging-operator to v4.6.0
- logging-operator now bind the pod ip and not all network interfaces

## v1.27.1

### Changed

- update logging-operator to v4.5.6
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- bindings for Openshift cluster-view cluster role
- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

### Changed

- update logging-operator to v4.5.0
- changed pdb minimum availability from 1 to 33% for better default that is not fixed, in normal replicas for HA will
	always default to 1

### Removed

- unused secret inside the operator service account

## v1.26.1

### Changed

- update logging-operator to v4.5.6

### Removed

- unused secret inside the operator service account

## v1.26.0

### Changed

- update logging-operator to v4.3.0

## v1.25.1

### Changed

- add digest to logging-operator image reference

## v1.25.0

### Changed

- update logging-operator to v4.1.0

## v1.24.1

### Fixed

- removed wrong volume in logging-operator

## v1.24.0

- First Release

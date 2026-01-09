# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v2.7.0

### Changed

- update prometheus to v3.8.1
- update alertmanager to v0.30.0

## v2.6.0

### Changed

- update prometheus to v3.5.0

## v2.5.0

### Changed

- update prometheus to v3.2.1
- update alertmanager to v0.28.1

## v2.4.0

### Changed

- update prometheus to v3.0.1
- update alertmanager to v0.28.0

### Fixed

- change prometheus-metrics service type to ClusterIP from NodePort

## v2.3.0

### Changed

- update prometheus to v2.55.1
- move alertmanager and prometheus PodMonitor to a ServiceMonitor

## v2.2.1

### Fixed

- missign honorLabel property for kube-state-metrics and prometheus-operator monitors

## v2.2.0

### Changed

- update prometheus to v2.54.1
- update alertmanager to v0.27.0

## v2.1.5

### Fixed

- namespace replacement failed in some edge cases

## v2.1.4

### Fixed

- actually fix the wrong labels selector for kubelet and dns-service monitor

## v2.1.3 \[YANKED]

### Fixed

- wrong labels selector for kubelet and dns-service monitor

## v2.1.2

### Fixed

- wrong kustomization directive in the principal kustomization file

## v2.1.1

WARNING: Do not use this version, because it will not build correctly

### Changed

- more robust namespace replacement
- update label substitution for kustomize deprecation

## v2.1.0

### Changed

- update prometheus to v2.51.1
- update alertmanager to v0.27.0

## v2.0.3

### Fixed

- namespace replacement failed in some edge cases

## v2.0.2

### Fixed

- wrong labels selector for kubelet and dns-service monitor

## v2.0.1

### Changed

- more robust namespace replacement
- update label substitution for kustomize deprecation

## v2.0.0

### Added

- resources for monitoring the new webhook workload

### Changed

- add `create: true` to all replacements, for increasing compatibility with older versions of kustomize
- update prometheus to v2.47.2
- update alertmanager to v0.26.0
- update service monitors

## v1.0.5

### Changed

- add `create: true` to all replacements, for increasing compatibility with older versions of kustomize

## v1.0.4

### Changed

- update prometheus to v2.45.0
- update alertmanager to v0.25.1

## v1.0.3

### Changed

- update prometheus to v2.43.1
- add digest to alertmanager and prometheus image reference

## v1.0.2

### Fixed

- add missing labels match for `allow-prometheus-operator-monitoring` network policy

## v1.0.1

### Fixed

- egress network policy for Prometheus

## v1.0.0

- First Release

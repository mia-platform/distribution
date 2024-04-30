# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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

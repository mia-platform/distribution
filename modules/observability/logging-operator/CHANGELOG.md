# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- bindings for Openshift cluster-view cluster role

### Changed

- update logging-operator to v4.5.0
- changed pdb minimum availability from 1 to 33% for better default that is not fixed, in normal replicas for HA will
	always default to 1

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

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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

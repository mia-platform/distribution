# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.27.0

### Added

- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

### Changed

- update traefik to v2.10.7
- removed status section from the CRDs
- changed pdb minimum availability from 1 to 25% for better default with a great number of replicas

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

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- update kyverno to v1.11.4
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- bindings for Openshift cluster-view cluster role

### Changed

- update kyverno to v1.11.1
- run the reports cleanup cronjob every hour instead of every 10 minutes
- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas
- add `create: true` to all replacements, for increasing compatibility with older versions of kustomize

## v1.26.1

### Changed

- update kyverno to v1.10.5

## v1.26.0

### Changed

- update kyverno to v1.10.3

## v1.25.1

### Changed

- update kyverno to v1.9.5

## v1.25.0

### Changed

- update kyverno to v1.9.2
- remove clientRateLimitQPS and clientRateLimitBurst flags to use the new increased defaults

## v1.24.1

### Fixed

- aggregation to `admin` cluster role

## v1.24.0

- First Release

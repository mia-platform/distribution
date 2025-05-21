# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- update kyverno to v1.14.1

## v1.31.1

### Changed

- update kyverno to v1.13.6

## v1.31.0

### Changed

- no changes

## v1.30.4

### Changed

- update kyverno to v1.13.6

## v1.30.3

### Changed

- update kyverno to v1.13.4

## v1.30.2

### Changed

- update kyverno to v1.13.3

## v1.30.1

### Changed

- update kyverno to v1.13.2

## v1.30.0

### Changed

- update kyverno to v1.13.1
- update PodDisruptionBudget from minAvailable to maxUnavailable

## v1.29.2

### Changed

- update kyverno to v1.12.7

## v1.29.1

### Changed

- update kyverno to v1.12.6

## v1.29.0

### Changed

- update kyverno to v1.12.5

## v1.28.1

### Changed

- update kyverno to v1.11.5

## v1.28.0

- no changes

## v1.27.2

### Changed

- update kyverno to v1.11.5

## v1.27.1

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

## v1.26.2

### Changed

- update kyverno to v1.10.7
- run the reports cleanup cronjob every hour instead of every 10 minutes
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

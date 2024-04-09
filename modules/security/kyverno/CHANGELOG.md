# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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

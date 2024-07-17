# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Fixed

- namespace replacement failed in some edge cases

## v2.0.2

### Changed

- more robust namespace replacement
- update label substitution for kustomize deprecation

## v2.0.1

### Changed

- add `create: true` to all replacements, for increasing compatibility with older versions of kustomize

## v2.0.0

### Changed

- add PodMonitors for kyverno-background and kyverno-reports resources

## v1.0.1

### Changed

- use `port` instead of `targetPort` on ServiceMonitor

## v1.0.0

- First Release

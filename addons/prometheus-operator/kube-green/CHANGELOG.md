# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.0.5

### Changed

- set `honorLabel` to true for keeping the sleepinfo namespace label on kube-green metrics

## v1.0.4

### Fixed

- namespace replacement failed in some edge cases

## v1.0.3

### Changed

- more robust namespace replacement
- update label substitution for kustomize deprecation

## v1.0.2

### Changed

- add `create: true` to all replacements, for increasing compatibility with older versions of kustomize

## v1.0.1

### Changed

- ServiceMonitor keep also metrics with prefix `kube_green`

## v1.0.0

- First Release

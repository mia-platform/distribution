# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- update metrics-server to v0.7.2

## v1.28.0

### Changed

- update metrics-server to v0.7.1
- metrics-server now bind the pod ip and not all network interfaces

## v1.27.2

### Fixed

- missing label and documentation for using the module on EKS with a custom CNI

## v1.27.1

### Changed

- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

- First Release

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.28.0

### Changed

- kube-green now bind the pod ip and not all network interfaces for their metrics and probes endpoints

## v1.27.2

### Changed

- update kube-webhook-certgen to v20231226-1a7112e06

## v1.27.1

### Changed

- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Changed

- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

## v1.26.1

### Changed

- update kube-green to 0.5.2
- update kube-webhook-certgen to v20231011-8b53cabe0

## v1.26.0

- no changes

## v1.25.1

### Changed

- update kube-green to 0.5.1

## v1.25.0

- no changes

## v1.24.1

### Fixed

- aggregation to `admin`, `edit` and `view` cluster roles

## v1.24.0

- First Release

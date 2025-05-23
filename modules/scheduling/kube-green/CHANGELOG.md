# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.31.0

### Changed

- update kube-green to 0.7.0

## v1.30.3

### Changed

- update kube-webhook-certgen to 1.5.3

## v1.30.2

### Changed

- update kube-webhook-certgen to 1.5.1

## v1.30.1

### Changed

- update kube-webhook-certgen to 1.5.0

## v1.30.0

### Changed

- update kube-green to 0.6.0

## v1.29.1

### Changed

- update kube-webhook-certgen to 1.4.4

## v1.29.0

- no changes

## v1.28.3

### Changed

- update kube-webhook-certgen to 1.4.3

## v1.28.2

### Changed

- update kube-webhook-certgen to 1.4.1

## v1.28.1

### Fixed

- wrong name in SERVICE_NAME env variable for the initContainer that generate the certificate for the webhook

## v1.28.0

### Changed

- kube-green now bind the pod ip and not all network interfaces for their metrics and probes endpoints

## v1.27.4

### Changed

- update kube-webhook-certgen to v1.4.1

## v1.27.3

### Fixed

- wrong name in SERVICE_NAME env variable for the initContainer that generate the certificate for the webhook

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

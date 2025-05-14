# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.31.1

### Changed

- update node-exporter to 1.9.1

## v1.31.0

### Changed

- update prometheus-operator to v0.80.1
- update kube-state-metrics to 2.14.0
- update node-exporter to 1.9.0

## v1.30.3

### Changed

- update kube-webhook-certgen to 1.5.1

## v1.30.2

### Changed

- update kube-webhook-certgen to 1.5.0

## v1.30.1

### Changed

- update prometheus-operator to v0.78.2

## v1.30.0

### Changed

- update prometheus-operator to v0.78.1
- update kube-state-metrics to 2.13.0
- update PodDisruptionBudget from minAvailable to maxUnavailable

## v1.29.2

### Changed

- update kube-webhook-certgen to 1.4.4

## v1.29.1

### Changed

- update prometheus-operator to v0.76.2

## v1.29.0

### Changed

- update prometheus-operator to v0.76.1
- update kube-state-metrics to 2.12.0

## v1.28.4

### Changed

- update kube-webhook-certgen to 1.4.3

## v1.28.3

### Changed

- update kube-webhook-certgen to 1.4.1
- update node-exporter to 1.8.2

## v1.28.2

### Changed

- update node-exporter to 1.8.1

## v1.28.1

### Changed

- update prometheus-operator to v0.73.2
- update node-exporter to 1.8.0

## v1.28.0

### Changed

- update prometheus-operator to v0.73.1
- update kube-state-metrics to 2.11.0
- node-exporter now bind the pod ip and not all network interfaces
- prometheus-operator now bind the pod ip and not all network interfaces
- prometheus-operator-webhook now bind the pod ip and not all network interfaces
- kube-state-metrcis now bind the pod ip and not all network interfaces

## v1.27.5

### Changed

- update node-exporter to 1.8.2
- update kube-webhook-certgen to v1.4.1

## v1.27.4

### Changed

- update node-exporter to 1.8.1

## v1.27.3

### Changed

- update node-exporter to 1.8.0

## v1.27.2

### Changed

- update kube-webhook-certgen to v20231226-1a7112e06

## v1.27.1

### Changed

- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Added

- bindings for Openshift cluster-view cluster role
- move webhook handling to a dedicated workload that support HA configuration

### Changed

- update prometheus-operator to v0.70.0
- update node-exporter to 1.7.0
- update kube-state-metrics to 2.10.1
- add nodeSelector for all workloads to ensure that they will run only on linux nodes

### Removed

- PodDistruptionBudget for prometheus-operator, no support for multiple replicas
	the budget will only impact on node drainage during mantainance

## v1.26.2

### Changed

- update node-exporter to 1.7.0
- update kube-state-metrics to 2.10.1

## v1.26.1

### Changed

- update kube-webhook-certgen to v20231011-8b53cabe0

## v1.26.0

### Changed

- update prometheus-operator to v0.67.1
- update node-exporter to 1.6.1
- update kube-state-metrics to 2.9.2

## v1.25.1

### Changed

- add digest to image references

## v1.25.0

### Changed

- update prometheus-operator to v0.64.1

## v1.24.0

- First Release

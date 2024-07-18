# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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

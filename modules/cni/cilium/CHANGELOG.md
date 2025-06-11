# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Changed

- removed deprecated enforce-mountable-secrets annotation

## v1.31.3

### Changed

- update cilium to v1.17.4

## v1.31.2

### Changed

- update cilium to v1.17.3

## v1.31.1

### Changed

- update cilium to v1.17.2

## v1.31.0

### Changed

- update cilium to v1.17.1
- cilium secrets are read only from kube-system namespace
- support for multiple protocol on the same port
- aks flavour now need the customization of the `cluster-pool-ipv4-cidr` value in the cilium configmap and doesn't use
	the `10.0.0.0/8` value as default anymore.

## v1.30.6

### Changed

- update cilium to v1.16.10

## v1.30.5

### Changed

- update cilium to v1.16.8

## v1.30.4

### Changed

- update cilium to v1.16.7

## v1.30.3

### Changed

- update cilium to v1.16.6

## v1.30.2

### Changed

- update cilium to v1.16.5

## v1.30.1

### Changed

- update cilium to v1.16.4

## v1.30.0

### Changed

- update PodDisruptionBudget from minAvailable to maxUnavailable
- change appArmorProfile from annotation to securityContext

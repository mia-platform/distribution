# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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

## v1.29.5

### Changed

- update cilium to v1.16.7

## v1.29.4

### Changed

- update cilium to v1.16.6

## v1.29.3

### Changed

- update cilium to v1.16.4

## v1.29.2

### Changed

- update cilium to v1.16.3

## v1.29.1

### Changed

- update cilium to v1.16.2

## v1.29.0

### Changed

- update cilium to v1.16.1

## v1.28.5

### Changed

- update cilium to v1.15.11

## v1.28.4

### Changed

- update cilium to v1.15.8

## v1.28.3

### Changed

- update cilium to v1.15.7

## v1.28.2

### Changed

- update cilium to v1.15.5

## v1.28.1

### Changed

- update cilium to v1.15.4

## v1.28.0

### Added

- new AKS flavour for installing the module in a BYOCNI AKS cluster on Microsoft Azure

### Changed

- update cilium to v1.15.3

## v1.27.6

### Changed

- update cilium to v1.14.13

## v1.27.5

### Changed

- update cilium to v1.14.11

## v1.27.4

### Fixed

- wrong digests for some cilium workloads

## v1.27.3

### Changed

- update cilium to v1.14.10

## v1.27.2

### Changed

- update cilium to v1.14.9

## v1.27.1

### Changed

- update cilium to v1.14.7
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Changed

- update cilium to v1.14.5
- for every emtpyDir volume use the Memory medium
- add nodeSelector for certificate jobs to ensure that they will run only on linux nodes
- move PodDistruptionBudget for hubble from minAvailable to maxUnavailable to allow single replicas during
	server upgrades to not block the drain
- removed not useful pod affinity for hubble relay workload

## v1.26.2

### Changed

- update cilium to v1.14.9

## v1.26.1

### Changed

- update cilium to v1.14.4

## v1.26.0

### Changed

- update cilium to v1.14.1

## v1.25.2

### Changed

- update cilium to v1.13.6

## v1.25.1

### Changed

- update cilium to v1.13.4

## v1.25.0

### Changed

- update cilium to v1.13.2

## v1.24.0

- First Release

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.29.0

- no changes

## v1.28.4

### Changed

- update oidc-proxy to 1.0.6-f1a6c3
- update dex to 2.41.1
- update kube-webhook-certgen to 1.4.3

## v1.28.3

### Changed

- update oidc-proxy to 1.0.6-89eb8d
- update kube-webhook-certgen to 1.4.1

## v1.28.2

### Changed

- update oidc-proxy to 1.0.6-0dce34
- update dex to 2.40.0

## v1.28.1

### Changed

- update oidc-proxy to 1.0.6-4c7812

## v1.28.0

### Changed

- update oidc-proxy to 1.0.6-ec5de3
- update dex to 2.39.1
- kube-oidc-proxy server now bind the pod ip and not all network interfaces

## v1.27.5

### Changed

- update oidc-proxy to 1.0.6-89eb8d
- update kube-webhook-certgen to 1.4.1

## v1.27.4

### Changed

- update oidc-proxy to 1.0.6-0dce34
- update dex to 2.40.0

## v1.27.3

### Changed

- update oidc-proxy to 1.0.6-4c7812
- update dex to 2.39.1

## v1.27.2

### Changed

- update oidc-proxy to 1.0.6-21733e
- update dex to 2.39.0
- update kube-webhook-certgen to v20231226-1a7112e06

## v1.27.1

### Changed

- update oidc-proxy to latest digest
- relaxed antiaffinity rule to allow pods on the same node if is not possible to spread them anymore

## v1.27.0

### Changed

- update oidc-proxy to latest digest
- add nodeSelector for all workloads to ensure that they will run only on linux nodes
- add pod anti affinity for all workloads to improve pod spreading in case of multiple replicas

## v1.26.2

### Changed

- update oidc-proxy 1.0.6-21733e
- update dex to 2.39.0

## v1.26.1

### Changed

- update oidc-proxy to latest digest
- update dex to 2.37.0
- update kube-webhook-certgen to v20231011-8b53cabe0

## v1.26.0

### Changed

- update oidc-proxy to latest digest

## v1.25.1

### Changed

- update oidc-proxy to latest digest

### Fixed

- digest reference for the tremolo image

## v1.25.0

### Changed

- update oidc-proxy to latest digest

## v1.24.1

### Fixed

- ServiceAccount nameReference now work on older version of kustomize

## v1.24.0

- First Release

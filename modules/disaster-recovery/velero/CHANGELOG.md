# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.31.0

- no changes

## v1.30.2

### Changed

- update velero to 1.15.2
- update minio and minio config version to latest releases

## v1.30.1

### Changed

- update velero to 1.15.1
- update velero plugins for Azure and AWS to 1.11.1
- update velero plugin for GCP to 1.11.1
- update velero plugin for Microsoft Azure Storage to 1.11.1
- update minio and minio config version to latest releases

## v1.30.0

### Changed

- update velero to 1.15.0
- update velero plugins for Azure and AWS to 1.11.0
- update velero plugin for GCP to 1.11.0
- update velero plugin for Microsoft Azure Storage to 1.11.0
- update minio and minio config version to latest releases

## v1.29.2

### Changed

- update minio and minio config version to latest releases

## v1.29.1

### Changed

- update minio and minio config version to latest releases

## v1.29.0

### Changed

- update velero to 1.14.1
- update velero plugins for Azure and AWS to 1.10.1
- update velero plugin for GCP to 1.10.1
- update velero plugin for Microsoft Azure Storage to 1.10.1

## v1.28.4

### Changed

- update minio and minio config version to latest releases

## v1.28.3

### Changed

- update minio and minio config version to latest releases

## v1.28.2

### Changed

- update minio and minio config version to latest releases

### Fixed

- permission to mount the correct secret to minio service account

## v1.28.1

### Changed

- update minio and minio config version to latest releases

## v1.28.0

### Added

- flavor for saving backups on AWS S3
- flavor for saving backups on Microsoft Azure Storage

### Changed

- update velero to 1.13.1
- update velero plugins for Azure and AWS to 1.9.2
- update velero plugin for GCP to 1.9.1
- gcp-storage flavor now is configured for easier setup with workload identity. It's a safer method and we want to
	promote its use by default
- velero server now bind the pod ip and not all network interfaces

## v1.27.4

### Changed

- update minio and minio config version to latest releases

## v1.27.3

### Changed

- update minio and minio config version to latest releases

### Fixed

- missing secret permission on minio serviceaccount

## v1.27.2

### Changed

- update velero to 1.12.4
- update minio and minio config version to latest releases

## v1.27.1

### Changed

- update velero to 1.12.3
- update minio and minio config version to latest releases

## v1.27.0

## Added

- bindings for Openshift cluster-view cluster role

### Changed

- for every emtpyDir volume use the Memory medium
- update minio and minio config version to latest releases
- update velero to 1.12.2
- update plugins to 1.8.2
- add nodeSelector for all workloads to ensure that they will run only on linux nodes

### Removed

- PodDistruptionBudget, no support for multiple replicas from maintainers the budget will only
	impact on node drainage during mantainance

## v1.26.2

### Changed

- update minio and minio config version to latest releases

## v1.26.1

### Changed

- update minio and minio config version to latest releases

## v1.26.0

### Added

- init container to minio config job for waiting that the minio server has been started correctly

### Changed

- update minio and minio config version to latest releases
- update velero to 1.11.1
- update plugins to 1.7.1

## v1.25.1

### Changed

- update minio and minio config version to latest releases
- update velero to 1.10.3
- update plugins to 1.6.2

## v1.25.0

### Changed

- update minio and minio config version to latest releases

## v1.24.2

### Fixed

- NetworkPolicy replacement for minio now work on older version of kustomize

## v1.24.1

### Changed

- default labels for some resources for alignment to other modules

## v1.24.0

- First Release

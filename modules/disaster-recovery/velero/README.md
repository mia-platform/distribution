# Velero Module

Velero is an open-source tool for backing up and restoring your Kubernetes cluster resources
and persistent volumes. It provides disaster recovery, data migration, and storage migration solutions.

[Here is the link to Velero official repository.](https://github.com/vmware-tanzu/velero)

## What the base module contains

- **CRDs:**
  - `Backups`
  - `BackupStorageLocations`
  - `DeleteBackupRequests`
  - `DownloadRequests`
  - `PodVolumeBackups`
  - `PodVolumeRestores`
  - `ResticRepositories`
  - `Restores`
  - `Schedules`
  - `ServerStatusRequests`
  - `VolumeSnapShotLocations`
- **Minio:**
  - **Configs:** configurations of related resources (e.g. `BackupStorageLocation`, network
  - policies, Minio authentication, etc.)
  - **Controller:** Minio deployment and service
  - **RBAC:** Minio service account
- **Resources (Velero):**
  - **Configs:** configurations of related resources (namespace, network policies)
  - **Controller:** base deployment for Velero
  - **RBAC:** service account, clusterrole and binding, with all the permissions needed to manage Velero resources
- **Patches:** a patch to add the GCP Velero plugin as `initContainer` and mount the GCP credentials to Velero container

## Flavors

### GCP Storage

- Patches and settings to use **GCP storage** instead of Minio. Follow the [instructions below](#gcp-storage-1) for a correct configuration.

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.0.0          | 1.9.5	        |

## User customization

### GCP storage

The GCP storage flavor needs some additional configuration to set up the GCP credentials and the `BackupStorageLocation`.

#### **Secret**

To use the flavor, you need to generate the `cloud-credentials` secret containing the GCP credentials to access the
bucket service account.

Append this block to your `kustomization.yaml` in the `custom-resources` directory, and add the credentials file in the
exact relative path indicated below.

```yaml
generatorOptions:
  disableNameSuffixHash: true
secretGenerator:
- name: cloud-credentials
  namespace: dr-system
  files:
  - ./secrets/cloud-credentials.json
```

#### **BackupStorageLocation**

The BackupStorageLocation resource is necessary to specify the GCP bucket location to Velero.

Here's a sample resource manifest, that can be customized with your information and features:

```yaml
apiVersion: velero.io/v1
kind: BackupStorageLocation
metadata:
  name: velero-bsl
  namespace: dr-system
  labels:
    app.kubernetes.io/name: velero
spec:
  provider: gcp
  accessMode: ReadWrite
  objectStorage:
    bucket: "disaster-recovery"
```

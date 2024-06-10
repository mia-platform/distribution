# Velero Module

Velero is an open-source tool for backing up and restoring your Kubernetes cluster resources
and persistent volumes. It provides disaster recovery, data migration, and storage migration solutions.

[Here is the link to the official repository].

The module will install velero and a MinIO instance for being autosufficient inside your cluster or if you cannot use
one of the flavor available for using cloud storage services.

## Module Contents

- **[crds](./base/crds)**: Prometheus Operator custom resource definitions
- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the `Namespace` and main deny `NetworkPolicy`
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[velero](./base/resources/workloads/velero):** resources for the velero controller

## Module Configurations

The module will install all its component inside the `dr-system` namespace and will use the following
default **ports**:

- velero:
  - **11270** expose the metrics for the k8s cluster
  - **11271** expose the metrics for the service
- minio:
  - **11272** expose the metrics for the service
  - **11273** expose the minio console

This module use the following user, gid and fsGroup:

- velero: **48060**
- minio: **48061**

## Flavors

### GCP Storage

- drop all minio related files and configuration
- add GCP Plugin `initContainer` to Velero

Follow the [instructions below](#gcp-storage) for a correct configuration.

## Compatibility Matrix

### Base Flavor

| Module Version | Velero | Minio                        | Minio Config                 | AWS Plugin |
|----------------|--------|------------------------------|------------------------------|------------|
| 1.24.x         | 1.10.2 | RELEASE.2023-03-22T06-36-24Z | RELEASE.2023-03-23T20-03-04Z | 1.6.1      |
| 1.25.x         | 1.10.3 | RELEASE.2023-06-19T19-52-50Z | RELEASE.2023-06-19T19-31-19Z | 1.6.2      |
| 1.26.0         | 1.11.1 | RELEASE.2023-08-23T10-07-06Z | RELEASE.2023-08-18T21-57-55Z | 1.7.1      |
| 1.26.1         | 1.11.1 | RELEASE.2023-11-11T08-14-41Z | RELEASE.2023-11-10T21-37-17Z | 1.7.1      |
| 1.26.2         | 1.11.1 | RELEASE.2024-04-06T05-26-02Z | RELEASE.2024-03-30T15-29-52Z | 1.7.1      |
| 1.27.0         | 1.12.2 | RELEASE.2023-12-14T18-51-57Z | RELEASE.2023-12-14T00-37-41Z | 1.8.2      |
| 1.27.1         | 1.12.3 | RELEASE.2024-02-14T21-36-02Z | RELEASE.2023-12-14T00-37-41Z | 1.8.2      |
| 1.27.2         | 1.12.4 | RELEASE.2024-04-06T05-26-02Z | RELEASE.2024-03-30T15-29-52Z | 1.8.2      |
| 1.27.3         | 1.12.4 | RELEASE.2024-06-06T09-36-42Z | RELEASE.2024-06-05T18-13-30Z | 1.8.2      |

### GCP Storage Flavor

| Module Version | Velero | GCP Plugin |
|----------------|--------|------------|
| 1.24.x         | 1.10.2 | 1.6.1      |
| 1.25.x         | 1.10.3 | 1.6.2      |
| 1.26.x         | 1.11.1 | 1.7.1      |
| 1.27.0         | 1.12.2 | 1.8.2      |
| 1.27.1         | 1.12.3 | 1.8.2      |
| 1.27.2         | 1.12.4 | 1.8.2      |
| 1.27.3         | 1.12.4 | 1.8.2      |

## User Customization

After the installation of the module a `cluster-admin` may want to add one or more `BackupStorageLocation` in addition
of the `defualt` location installed with the **base** flavor, and then create one or more `Schedule` for setting up
the backup of the cluster resources.

### Base

The base flavor for being in a production ready state will need an override of the `minio-credentials` secret with
a more robust password than the default one created automatically.

### GCP Storage

The GCP storage flavor will not create a `default` `BackupStorageLocation` for leaving the full configuration to
the end user, and it will need further configurations for setting up the authorization between velero and the GCP
API.

By default the flavor will configure the GCP plugin to mount a secret named `cloud-credentials` containing the GCP
credentials to access the bucket service account.

Append this block to your `kustomization.yaml` in the `custom-resources` directory, be careful that the path inside
the secretGenerator block can only be relative to the location of the yaml file:

```yaml
secretGenerator:
- name: cloud-credentials
  namespace: dr-system
  files:
  - cloud-credentals=<path-to-local-file>
```

[Here is the link to the official repository]: https://github.com/vmware-tanzu/velero "Velero GitHub Repository"

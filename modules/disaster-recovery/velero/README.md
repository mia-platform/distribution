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

### AWS Storage

- drop all minio related files and configuration
- add AWS Plugin `initContainer` to Velero

Follow the [instructions below](#aws-storage) for a correct configuration.

### Azure Storage

- drop all minio related files and configuration
- add Microsoft Azure Plugin `initContainer` to Velero

Follow the [instructions below](#azure-storage) for a correct configuration.

### GCP Storage

- drop all minio related files and configuration
- add GCP Plugin `initContainer` to Velero

Follow the [instructions below](#gcp-storage) for a correct configuration.

## Compatibility Matrix

### Base Flavor

| Module Version | Velero | Minio                        | Minio Config                 | AWS Plugin |
|----------------|--------|------------------------------|------------------------------|------------|
| 1.31.x         | 1.15.2 | RELEASE.2025-02-03T21-03-04Z | RELEASE.2025-02-04T04-57-50Z | 1.11.1     |
| 1.32.0         | 1.16.1 | RELEASE.2025-05-24T17-08-30Z | RELEASE.2025-05-21T01-59-54Z | 1.12.1     |
| 1.32.1         | 1.16.2 | RELEASE.2025-07-23T15-54-02Z | RELEASE.2025-07-21T05-28-08Z | 1.12.2     |
| 1.33.0         | 1.16.2 | RELEASE.2025-07-23T15-54-02Z | RELEASE.2025-07-21T05-28-08Z | 1.12.2     |

### AWS Storage Flavor

| Module Version | Velero | AWS Plugin |
|----------------|--------|------------|
| 1.31.x         | 1.15.2 | 1.11.1     |
| 1.32.x         | 1.16.1 | 1.12.1     |
| 1.32.0         | 1.16.1 | 1.12.1     |
| 1.32.1         | 1.16.2 | 1.12.2     |
| 1.33.0         | 1.16.2 | 1.12.2     |

### Azure Storage Flavor

| Module Version | Velero | Azure Plugin |
|----------------|--------|--------------|
| 1.31.x         | 1.15.2 | 1.11.1       |
| 1.32.0         | 1.16.1 | 1.12.1       |
| 1.32.1         | 1.16.2 | 1.12.2       |
| 1.33.0         | 1.16.2 | 1.12.2       |

### GCP Storage Flavor

| Module Version | Velero | GCP Plugin |
|----------------|--------|------------|
| 1.31.x         | 1.15.2 | 1.11.1     |
| 1.32.0         | 1.16.1 | 1.12.1     |
| 1.32.1         | 1.16.2 | 1.12.2     |
| 1.33.0         | 1.16.2 | 1.12.2     |

## User Customization

After the installation of the module a `cluster-admin` may want to add one or more `BackupStorageLocation` in addition
of the `default` location installed with the **base** flavor, and then create one or more `Schedule` for setting up
the backup of the cluster resources.

### Base

The base flavor for being in a production ready state will need an override of the `minio-credentials` secret with
a more robust password than the default one created automatically.

### AWS Storage

The AWS storage flavor will not create any resource for setting up backups with velero for leaving the full
configuration to the end user, and it will also need further configurations for setting up the authorization between
velero and the AWS APIs.

By default the flavor will setup velero to work with [IAM Roles for Service Accounts] or [EKS Pod Identity],
and we suggest you to setup your AWS cluster to work with one of these methods if possible.

For IAM Roles for Service Accounts you will have to add the `eks.amazonaws.com/role-arn` annotation to the
`velero` `ServiceAccount` with the arn of the role that you have created folling the AWS guide.  
If you use the EKS Pod Identity instead you don't have to set anything on the resources and you need to follow
the instructions for adding permisions to the `velero` `ServiceAccount` for the `dr-system` namespace.

The minimal IAM Policy to assign the to service account is the following:

```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeVolumes",
				"ec2:DescribeSnapshots",
				"ec2:CreateTags",
				"ec2:CreateVolume",
				"ec2:CreateSnapshot",
				"ec2:DeleteSnapshot"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"s3:GetObject",
				"s3:DeleteObject",
				"s3:PutObject",
				"s3:AbortMultipartUpload",
				"s3:ListMultipartUploadParts"
			],
			"Resource": [
				"arn:aws:s3:::<YOUR-BUCKET-NAME-HERE>/*"
			]
		},
		{
			"Effect": "Allow",
			"Action": [
				"s3:ListBucket"
			],
			"Resource": [
				"arn:aws:s3:::<YOUR-BUCKET-NAME-HERE>"
			]
		}
	]
}
```

### Azure Storage

The Azure storage flavor will not create any resource for setting up backups with velero for leaving the full
configuration to the end user, and it will also need further configurations for setting up the authorization between
velero and the Microsoft Azure APIs.

By default the flavor will setup velero to work with [Microsoft Entra Workload ID], and we suggest you to setup your
AKS cluster to work with it if possible. You then will have to add the `azure.workload.identity/client-id`
annotation to the `velero` `ServiceAccount` with client id property of the user assigned identity that you have created
following the Azure guide. You will also have to add the `azure.workload.identity/use` label to the `velero` `Deployment`
with a value of `"true"` to allow the pod to use the identity.

The minimal Role Definition to assign the to service account is the following:

```json
{
	"Name": "VeleroRole",
	"Description": "Velero related permissions to perform backups, restores and deletions",
	"Actions": [
		"Microsoft.Compute/disks/read",
		"Microsoft.Compute/disks/write",
		"Microsoft.Compute/disks/endGetAccess/action",
		"Microsoft.Compute/disks/beginGetAccess/action",
		"Microsoft.Compute/snapshots/read",
		"Microsoft.Compute/snapshots/write",
		"Microsoft.Compute/snapshots/delete",
		"Microsoft.Storage/storageAccounts/listkeys/action",
		"Microsoft.Storage/storageAccounts/regeneratekey/action",
		"Microsoft.Storage/storageAccounts/read",
		"Microsoft.Storage/storageAccounts/blobServices/containers/delete",
		"Microsoft.Storage/storageAccounts/blobServices/containers/read",
		"Microsoft.Storage/storageAccounts/blobServices/containers/write",
		"Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey/action"
	],
	"DataActions" :[
		"Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete",
		"Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read",
		"Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write",
		"Microsoft.Storage/storageAccounts/blobServices/containers/blobs/move/action",
		"Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action"
	],
	"AssignableScopes": ["/subscriptions/'<YOUR-AZURE-SUBSCRIPTION-HERE>'"]
	}
```

### GCP Storage

The GCP storage flavor will not create any resource for setting up backups with velero for leaving the full
configuration to the end user, and it will also need further configurations for setting up the authorization between
velero and the GCP APIs.

By default the flavor will setup velero to work with [Workload Identity Federation for GKE], and we suggest you to
setup your GKE cluster to work with it if possible. You then will have to add the `iam.gke.io/gcp-service-account`
annotation to the `velero` `ServiceAccount` with the service account email that you have created following the GCP
documentation.

The minimal IAM Role permissions to assign the to service account are the following:

```txt
compute.disks.get
compute.disks.create
compute.disks.createSnapshot
compute.projects.get
compute.snapshots.get
compute.snapshots.create
compute.snapshots.useReadOnly
compute.snapshots.delete
compute.zones.get
storage.objects.create
storage.objects.delete
storage.objects.get
storage.objects.list
iam.serviceAccounts.signBlob
```

[Here is the link to the official repository]: https://github.com/vmware-tanzu/velero "Velero GitHub Repository"
[IAM Roles for Service Accounts]: https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html "EKS IAM Roles for Service Accounts official documentation"
[EKS Pod Identity]: https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html "EKS Pod Identity official documentation"
[Microsoft Entra Workload ID]: https://learn.microsoft.com/en-us/azure/aks/workload-identity-overview "Microsoft Entra Workload ID with Azure Kubernetes Service official documentation"
[Workload Identity Federation for GKE]: https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity "Authenticate to Google Cloud APIs from GKE workloads"

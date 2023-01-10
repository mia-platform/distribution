# Velero: GCP Storage flavor

This flavor implements the necessary patches to use Velero with GCP storage.

## Usage

### Secret

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

### BucketStorageLocation

The BucketStorageLocation resource is necessary to specify the GCP bucket location to Velero.

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

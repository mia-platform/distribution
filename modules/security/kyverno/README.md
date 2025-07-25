# Kyverno Module

Kyverno is a Kubernetes policy manager that leverages CRDs to enforce policies at the cluster or namespace level.  
These policies filter what is being deployed, and ensure that they meet the defined security specifications or that
some functionalities are restricted.  
Kyverno can also patch resources at apply time or generate them from scratch in order to automate certain features
or ensure that necessary fields are automatically compiled.

[Here is the link to the official repository].

The module will install one deployment with the Kyverno controller, and will add the correct permissions to operate
on the installed CRDs for the builtin `admin` ClusterRole.

## Upgrade Consideration

If you are upgrading from 1.25 to >= of 1.26 you have to do some work before upgrading. The upgrade will move you from
the 1.9 to the 1.10+ version of kyverno and this will means that the main controller will be split up in 4 different
ones.

We suggest to do the update during an update windows because it will cause some downtime to the kyverno infrastructure.

1. The first thing to do is to set the `generate.synchronize: true` property to `false` on every resource that need it
	or during the upgrade process, the resources generated by those resources will be deleted.
1. Then to do a backup of all the Kyverno resources that you have installed in your cluster with
	`kubectl get pol,cpol,cleanpol,ccleanpol,polex -A -o yaml > kyvernobackup.yaml`
1. Remove the resources that you have backed up with `kubectl delete -f kyvernobackup.yaml`
1. Scale down the kyverno and kyverno-cleanup deployments to 0
1. Delete the webhook managed by kyverno with `kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io,
mutatingwebhookconfigurations.admissionregistration.k8s.io -l webhook.kyverno.io/managed-by=kyverno`
1. Delete the `ClusterRole`s where the name start with `mia-platform:kyverno:`, they will be replaced with new ones
	and the ones for the main controller will be aggregated to only one new resource
1. Install the updated module, after the installation if the main deployment and the cleanup controller are not scaled
	to their expected replicas (it can happen if you left the default values), scale them up to the desired value
1. Restore your resources being careful to follow the following steps:
	1. Restore the `generate.synchronize` property to `true` for all resources that you changed to `false` in the first
		step
	1. Add the new field `spec.generateExisting: true` to those resources for allowing the update of the already existing
		resources
	1. Update the resources to the new schemas if applcable, you can read the [relase notes] to check what is changed
	1. Be mindful that `spec.generateExisting` can lead to the creation of additional resources, be sure to check and
		adjust your match/exclude blocks to account for this

## Module Contents

- **[crds](./base/crds)**: `kyverno` custom resource definitions
- **[resources](./base/resources)**: `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
  - **[configs](./base/resources/configs):** contains the configurations for the service, including the `Namespace`,
		`NetworkPolicy` and `PodDistruptionBudget` resources
  - **[RBAC](./base/resources/rbac):**
  - **[workloads](./base/resources/workloads):**
    - **[kyverno-admission](./base/resources/workloads/kyverno-admission):** resources for the kyverno main controller.
				This component handles webhook callbacks from the API server for verification, mutation, Policy Exceptions,
				and the processing engine
    - **[kyverno-background](./base/resources/workloads/kyverno-background):** resources for the kyverno background
				controller. This component is responsible for processing of generate and mutate-existing rules
    - **[kyverno-cleanup](./base/resources/workloads/kyverno-cleanup):** resources for the kyverno cleanup controller.
				This component will be responsible for processing of Cleanup Policies
    - **[kyverno-cleanup-job](./base/resources/workloads/kyverno-cleanup-job):** resources for the kyverno cleanup cronjob.
				This component will be responsible for removing cluseradmissionreports and admissionreport if they are
				a sizeble amounts
    - **[kyverno-reports](./base/resources/workloads/kyverno-reports):** resources for the kyverno reports controller.
				This component will be responsible for handling of Policy Reports

## Module Configurations

The module will install all its component inside the `kyverno-system` namespace and will use the following
default **ports**:

- kyverno-admission:
  - **11218** expose the webhook functionality
  - **11210** expose the metrics for the service
  - **11211** expose the profile information for the service
- kyverno-background:
  - **11214** expose the metrics for the service
  - **11215** expose the profile information for the service
- kyverno-cleanup:
  - **11219**expose the webhook functionality
  - **11212** expose the metrics for the service
  - **11213** expose the profile information for the service
- kyverno-reports:
  - **11216** expose the metrics for the service
  - **11217** expose the profile information for the service

This module use the following user, gid and fsGroup:

- kyverno-admission: **48010**
- kyverno-background: **48012**
- kyverno-cleanup: **48011**
- kyverno-reports: **48013**
- kyverno-cleanup-job: **48014**

## Compatibility Matrix

| Module Version | Tool Version   |
|----------------|----------------|
| 1.30.0         | 1.13.1         |
| 1.30.1         | 1.13.2         |
| 1.30.2         | 1.13.3         |
| 1.30.3         | 1.13.4         |
| 1.30.4         | 1.13.6         |
| 1.31.0         | 1.13.4         |
| 1.31.1         | 1.13.6         |
| 1.32.0         | 1.14.2         |
| 1.32.1         | 1.14.4         |

## User customization

After the installation a cluster operator or a namespace admin may want to setup `Policies` or `ClusterPolicies`
for allowing, denying or modifying resource applied to the cluster or namespace for meeting regulatory or security
profiles.  
To view some examples, you can explore the [kyverno policies repository] or check them in the official [documentation]
site.

## GKE User

For private GKE cluster you may have to add a new firewall rules for allowing the api-resource network to
reach the webhook port.

## EKS User

If you are using our cni module or a cni that don’t use the amazon cni daemonset, you have to set the `hostNetwork`
option of deployment to `true` for allowing the api-server to reach its endpoint. You can easily target the correct
workload with the labelSelector `distribution.mia-platform.eu/expose-webhook=true`.

[Here is the link to the official repository]: https://github.com/kyverno/kyverno "Kyverno GitHub Repository"
[relase notes]: https://github.com/kyverno/kyverno/releases
[kyverno policies repository]: https://github.com/kyverno/policies "Kyverno Policies GitHub Repository"
[documentation]: https://kyverno.io/policies/ "Kyverno Policies Site"

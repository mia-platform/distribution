# Cilium Module

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity
between workloads powered by eBPF.  
The Cilium module configures the *Container Network Interface* (CNI) necessary to implement the
*Kuberentes network model* of your cluster. It also install Hubble for visualizing the network topology of your
namespace and see what traeffic is allowed or dropped by the NetworkPolicy applied to the cluster.

[Here is the link to the official repository].

The Cilium project needs to run with an high degree of permessions on your cluster and on your nodes, so is one of
the most critical pieces of workload that run in your cluster. Be mindful of that an keep access to its resources to
the least possible people and put all the appropriate security measures inside the cluster for protect it.

For handling the network correctly in all the various cluster topology and correctly integrate the module with
the autoscaling controller, or the ones of the cloud providers, we recommend to create the cluster with the
`ignore-taint.cluster-autoscaler.kubernetes.io/cilium-agent-not-ready=true:NoExecute` taint on the nodes to allow
the Cilium DaemonSet to run on them before everything else and setup the node properly.

## Module Contents

- **[resources](./base/resources)**:
  - **[configs](./base/resources/configs):** contains the main configuration for cilium and hubble workloads
  - **[RBAC](./base/resources/rbac):** `ClusterRole`s to aggregate to `view`, `edit`, `cluster-view` and `admin`
			cluster roles
  - **[workloads](./base/resources/workloads):**
    - **[cilium-agent](./base/resources/workloads/cilium-agent):** resources for the DaemonSet agent that will handle the
				eBPF module on the nodes
    - **[cilium-operator](./base/resources/workloads/cilium-operator):** resources for the operator that will handle the
				correct configuration for cilium
    - **[hubble](./base/resources/workloads/hubble):** workloads for the Hubble observability platform

## Module Configurations

The module will install all its components inside the `kube-system` namespace. This is to further highlight that
the Cilium workloads must be protected in the same way you will protect the main Kubernetes components.

As Cilium is a complex application that will need multiple ports to handle correctly all its functions we will not
change the default ports or uid, gid or fsGroup for its workloads but we will encourage you to seek the official
documentation for all the [system requirements].

## Flavors

### AKS

- deploys the `node-init` DaemonSet

The AKS flavor is indicated for setting up cilium to work inside an AKS cluster in BYOCNI plugin. You can follow
the [official guide from Microsoft] for setting the cluster correctly.

### EKS

- Adds `egress-masquerad-interfaces: eth0` in the Cilium config

The EKS flavor is indicated for setting up cilium to work inside an EKS cluster in overlay mode that allows running
more pods per Kubernetes worker node than the ENI limit, but means that pod connectivity to resources outside the
cluster (e.g., VMs in the VPC or AWS managed services) is masqueraded (i.e., SNAT) by Cilium to use the VPC IP address
of the Kubernetes worker node.

**:warning: When using this module, it is expected that the AWS CNI Daemonset is disabled in the cluster :warning:**

Since Cilium will manage the ENIs you will have to apply this patch before installing the module:

```bash
kubectl -n kube-system patch daemonset aws-node --type='strategic' -p='{"spec":{"template":{"spec":{"nodeSelector":{"io.cilium/aws-node-enabled":"true"}}}}}'
```

### GKE

- deploys the `node-init` DaemonSet
- changes to the `cilium-config` configmap:
  - tunnel: `disabled`
  - enable-endpoint-routes: `true`
  - enable-health-check-loadbalancer-ip: `true`
  - ipam: `kubernetes`
  - remove `cluster-pool-ipv4-cidr`
  - remove `cluster-pool-ipv4-mask-size`
- changes the path `/opt/cni/bin` to `/home/kubernetes/bin` in the Cilium agent DaemonSet

The GKE flavor is indicated for setting up cilium to work inside a GKE cluster, and the `node-init` DaemonSet will
update the nodes correctly to use Cilium as CNI plugin.

## Compatibility Matrix

| Module Version | Cilium           | Hubble UI   |
|----------------|------------------|-------------|
| 1.30.0         | 1.16.3           | v0.13.1     |
| 1.30.1         | 1.16.4           | v0.13.1     |
| 1.30.2         | 1.16.5           | v0.13.1     |
| 1.30.3         | 1.16.6           | v0.13.1     |
| 1.30.4         | 1.16.7           | v0.13.1     |
| 1.30.5         | 1.16.8           | v0.13.2     |
| 1.30.6         | 1.16.10          | v0.13.2     |
| 1.31.0         | 1.17.1           | v0.13.1     |
| 1.31.1         | 1.17.2           | v0.13.2     |
| 1.31.2         | 1.17.3           | v0.13.2     |
| 1.31.3         | 1.17.4           | v0.13.2     |
| 1.32.0         | 1.17.4           | v0.13.2     |
| 1.32.1         | 1.17.5           | v0.13.2     |
| 1.32.2         | 1.17.6           | v0.13.2     |

## User customization

### Base, EKS

By default these flavor will set the `cluster-pool-ipv4-cidr` property inside the `cilium-config` ConfigMap to
`10.10.0.0/16` and the `cluster-pool-ipv4-mask-size` to `24`. If you don’t want to use these values you can change them
via a patch setting them to your desired values.

### AKS

For this flavor you **must** change the value of the `cluster-pool-ipv4-cidr`  property inside the `cilium-config`
ConfigMap with a patch and setting it to a value that does not overlap with the default service CIDR of AKS. For
avoiding the setup with a wrong value, the module will set the property to `CHANGE_TO_YOUR_CLUSTER_POD_IPV4_CIDR`
value that will trigger an error inside Cilium workload and will not start.

### GKE

For this flavor you **must** change the value of the `ipv4-native-routing-cidr` property inside the `cilium-config`
ConfigMap with a patch and setting it to the Pod CIDR that you have selected during the cluster creation. For
avoiding the setup with a wrong value, the module will set the property to `CHANGE_TO_YOUR_CLUSTER_POD_IPV4_CIDR`
value that will trigger an error inside Cilium workload and will not start.

[Here is the link to the official repository]: https://github.com/cilium/cilium "Cilium GitHub Repository"
[system requirements]: https://docs.cilium.io/en/v1.17/operations/system_requirements/ "Cilium System Requirements"
[official guide from Microsoft]: https://learn.microsoft.com/en-us/azure/aks/use-byo-cni "Bring your own Container Network Interface plugin with Azure Kubernetes Service"

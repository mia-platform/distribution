#! /usr/bin/env sh

set -o nounset
set -o errexit

CILIUM_VERSION="${1:-1.14.4}"
FOLDER_PATH=$(dirname -- "${0}")

helm repo add cilium https://helm.cilium.io/

helm repo update cilium

helm template cilium cilium/cilium \
	--version "${CILIUM_VERSION}" \
	--namespace kube-system \
	--values "${FOLDER_PATH}/values.yaml" > "${FOLDER_PATH}/kind-${CILIUM_VERSION}.yaml"

helm template cilium cilium/cilium \
	--version "${CILIUM_VERSION}" \
	--namespace kube-system \
	--values "${FOLDER_PATH}/values.yaml" \
	--values "${FOLDER_PATH}/eks-values.yaml" > "${FOLDER_PATH}/eks-${CILIUM_VERSION}.yaml"

helm template cilium cilium/cilium \
	--version "${CILIUM_VERSION}" \
	--namespace kube-system \
	--values "${FOLDER_PATH}/values.yaml" \
	--values "${FOLDER_PATH}/gke-values.yaml" > "${FOLDER_PATH}/gke-${CILIUM_VERSION}.yaml"

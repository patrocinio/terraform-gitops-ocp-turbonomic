#!/usr/bin/env bash

SANAME="$1"
NAMESPACE="$2"
DEST_DIR="$3"

mkdir -p "${DEST_DIR}"

cat > "${DEST_DIR}/roles.yaml" << EOL
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  creationTimestamp: null
  name: ${SANAME}
  annotations:
    argocd.argoproj.io/sync-wave: "0"
rules:
- apiGroups:
  - ""
  resources:
  - configmaps
  - endpoints
  - events
  - persistentvolumeclaims
  - pods
  - secrets
  - serviceaccounts
  - services
  verbs:
  - '*'
- apiGroups:
  - apps
  resources:
  - daemonsets
  - deployments
  - statefulsets
  - replicasets
  verbs:
  - '*'
- apiGroups:
  - apps
  resources:
  - deployments/finalizers
  verbs:
  - update
- apiGroups:
  - extensions
  resources:
  - deployments
  verbs:
  - '*'
- apiGroups:
  - ""
  resources:
  - namespaces
  verbs:
  - get
- apiGroups:
  - policy
  resources:
  - podsecuritypolicies
  - poddisruptionbudgets
  verbs:
  - '*'
- apiGroups:
  - rbac.authorization.k8s.io
  resources:
  - clusterrolebindings
  - clusterroles
  - rolebindings
  - roles
  verbs:
  - '*'
- apiGroups:
  - batch
  resources:
  - jobs
  verbs:
  - '*'
- apiGroups:
  - monitoring.coreos.com
  resources:
  - servicemonitors
  verbs:
  - get
  - create
- apiGroups:
  - charts.helm.k8s.io
  resources:
  - '*'
  verbs:
  - '*'
- apiGroups:
  - networking.istio.io
  resources:
  - gateways
  - virtualservices
  verbs:
  - '*'
- apiGroups:
  - cert-manager.io
  resources:
  - certificates
  verbs:
  - '*'
- apiGroups:
    - route.openshift.io
  resources:
    - routes
    - routes/custom-host
  verbs:
    - '*'
- apiGroups:
    - security.openshift.io
  resourceNames:
    - ${NAMESPACE}-${SANAME}-anyuid
  resources:
    - securitycontextconstraints
  verbs:
    - use
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: ${SANAME}
  annotations:
    argocd.argoproj.io/sync-wave: "0"
subjects:
- kind: ServiceAccount
  name: ${SANAME}
  namespace: ${NAMESPACE}
roleRef:
  kind: ClusterRole
  name: ${SANAME}
  apiGroup: rbac.authorization.k8s.io    
EOL

echo "created cluster roles successfully...."
cat "${DEST_DIR}/roles.yaml"
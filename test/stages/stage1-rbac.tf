module "gitops_rbac" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-rbac.git"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  service_account_namespace = module.gitops_turbo_namespace.name
  service_account_name      = "t8c-operator"
  namespace = module.gitops_turbo_namespace.name
  rules = [{
    apiGroups = [""]
    resources = ["configmaps","endpoints","events","persistentvolumeclaims","pods","secrets","serviceaccounts","services"]
    verbs = ["*"]
  },{
    apiGroups = ["apps"]
    resources = ["daemonsets","deployments","statefulsets","replicasets"]
    verbs = ["*"]
  },{
    apiGroups = ["apps"]
    resources = ["deployments/finalizers"]
    verbs = ["update"]
  },{
    apiGroups = ["extensions"]
    resources = ["deployments"]
    verbs = ["*"]
  },{
    apiGroups = [""]
    resources = ["namespaces"]
    verbs = ["get"]
  },{
    apiGroups = ["policy"]
    resources = ["podsecuritypolicies","poddisruptionbudgets"]
    verbs = ["*"]
  },{
    apiGroups = ["rbac.authorization.k8s.io"]
    resources = ["clusterrolebindings","clusterroles","rolebindings","roles"]
    verbs = ["*"]
  },{
    apiGroups = ["batch"]
    resources = ["jobs"]
    verbs = ["*"]
  },{
    apiGroups = ["monitoring.coreos.com"]
    resources = ["servicemonitors"]
    verbs = ["get","create"]
  },{
    apiGroups = ["charts.helm.k8s.io"]
    resources = ["*"]
    verbs = ["*"]
  },{
    apiGroups = ["networking.istio.io"]
    resources = ["gateways","virtualservices"]
    verbs = ["*"]
  },{
    apiGroups = ["cert-manager.io"]
    resources = ["certificates"]
    verbs = ["*"]
  },{
    apiGroups = ["route.openshift.io"]
    resources = ["routes","routes/custom-host"]
    verbs = ["*"]
  },{
    apiGroups = ["security.openshift.io"]
    resourceNames = ["turbonomic-t8c-operator-anyuid"]
    resources = ["securitycontextconstraints"]
    verbs = ["use"]
  }
  ]
  server_name = module.gitops.server_name
}


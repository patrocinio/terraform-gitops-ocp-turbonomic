module "gitops_module_turbo" {
  source = "./module"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name

  //cluster_ingress_hostname = module.dev_cluster.platform.ingress
  //cluster_type = module.dev_cluster.platform.type_code
  //tls_secret_name = module.dev_cluster.platform.tls_secret
  //kubeseal_cert = module.argocd-bootstrap.sealed_secrets_cert

  namespace = module.gitops_turbo_namespace.name
  storage_class_name = module.gitops_storageclass.storage_name

}

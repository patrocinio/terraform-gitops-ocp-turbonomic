module "gitops_sccs" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-sccs.git"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  namespace = module.gitops_turbo_namespace.name
  service_account = module.gitops_rbac.service_account_name
  sccs = ["anyuid","privileged"]
  server_name = module.gitops.server_name
}

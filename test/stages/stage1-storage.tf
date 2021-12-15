module "gitops_storageclass" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="ibmc-vpc-block-10iops-tier-test"
  provisioner_name="vpc.block.csi.ibm.io"
 
  parameter_list=[{key = "classVersion",value = "1"},{key = "csi.storage.k8s.io/fstype", value = "ext4"}, {key="encrypted",value="false"},{key="profile",value="10iops-tier"},{key="sizeRange",value="[10-2000]GiB]"}]

}
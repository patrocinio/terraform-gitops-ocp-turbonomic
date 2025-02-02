#  Turbonomic Gitops terraform module
![Verify and release module](https://github.com/cloud-native-toolkit/terraform-gitops-ocp-turbonomic/workflows/Verify%20and%20release%20module/badge.svg)

Deploys Turbonomic operator into the cluster and creates an instance. By default, the kubeturbo probe is also installed into the cluster along with the OpenShift ingress.  Other probes to deploy can be specified in the probes variable, by default it will deploy:  turboprobe, openshift ingress, and instana.  The namespace to deploy within the cluster is defined in the variables, default is Turbonomic.  Also note if deploying on mzr cluster you'll need the custom storage created, default is true to create this automatically, if not mzr you can set to false and use another storage class you'd like.

If the operator is unable to pull the image due to a docker rate limit error from your cluster, then set a docker pull secret and pass the name of the pull secret in the `pullsecret_name` variable.

### Supported Component Selector Probe Types 
Use these names in the `probes` variable to define additional probes as needed for your environment:
```
"kubeturbo","instana","openshiftingress", "aws", "azure", "prometheus", "servicenow", "tomcat", "jvm", "websphere", "weblogic"
```
## Supported platforms

- OCP 4.6+

## Module dependencies

The module uses the following elements

### Environment

- kubectl - used to apply the yaml to create the route

## Suggested companion modules

The module itself requires some information from the cluster and needs a
namespace to be created. The following companion
modules can help provide the required information:

- Gitops - github.com/cloud-native-toolkit/terraform-tools-gitops
- Namespace - github.com/ibm-garage-cloud/terraform-cluster-namespace
- StorageClass - github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass


## Example usage

```hcl-terraform
module "turbonomic" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-turbonomic"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_turbo_namespace.name
  storage_class_name = module.gitops_storageclass.storage_name
}
```

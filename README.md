#  Turbonomic Gitops terraform module
![Verify and release module](https://github.com/cloud-native-toolkit/terraform-gitops-ocp-turbonomic/workflows/Verify%20and%20release%20module/badge.svg)

Deploys Turbonomic operator into the cluster and creates an instance via gitops.

** THIS Module is under development


## Supported platforms

- OCP 4.6+

## Module dependencies

The module uses the following elements

### Terraform providers

- helm - used to configure the scc for OpenShift
- null - used to run the shell scripts

### Environment

- kubectl - used to apply the yaml to create the route

## Suggested companion modules

The module itself requires some information from the cluster and needs a
namespace to be created. The following companion
modules can help provide the required information:

- Cluster - https://github.com/ibm-garage-cloud/terraform-cluster-ibmcloud
- Namespace - https://github.com/ibm-garage-cloud/terraform-cluster-namespace


## Example usage

```hcl-terraform
module "dev_tools_turbonomic" {

}
```


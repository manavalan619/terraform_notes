# Module DataFactory

## Description

This module creates an Azure DataFactory

## Usage

### Module Definitions

- Databricks module location : providers/azure/datafactory

```hcl
module "datafactory" {
  source                              = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/DataFactory/"
  env_code                            = var.env_code
  project_resource_group_name         = data.azurerm_resource_group.rg.name
  project_name                        = var.project_name
  short_project_name                  = var.short_project_name
  location_code                       = var.location_code
  resource_index                      = var.resource_index
  resource_deploy_integration_runtime = var.resource_deploy_integration_runtime
  resource_deploy                     = var.resource_deploy
  vsts_configuration                  = var.vsts_configuration
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Data Factory."
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "short_project_name" {
  type        = string
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_index" {
  type        = string
  description = "Resource Index"
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_deploy_integration_runtime" {
  type        = bool
  description = "Set to true if linked intergation runtime should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "vsts_configuration" {
  description = ""
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}
```

## Outputs

The following variables are available as module outputs variables

```
output "adf_id" {
  value       = module.datafactory.adf_id
  description = "Datafactory ID."
}
output "adf_name" {
  value       = module.datafactory.adf_name
  description = "Datafactory Name."
}
output "adf_identity_id" {
  value       = module.datafactory.adf_identity_id
  description = "Datafactory Identity ID."
}
```

## Example variables values in env.tfvars for each env

- example for `dv`, `at` and `hp` :

  ```hcl
  resource_deploy_adf = true
  resource_deploy_adf_integration_runtime = true
  shared_ir_name = "MAIN"
  rg_tf_name  = "RG-TOTAL-TF-MGT-TG-DV"
  akv_tf_name = "akv-tf-dv-ne-<projectName>"
  ```

- example for `p` :
  ```hcl
  resource_deploy_adf = true
  resource_deploy_adf_integration_runtime = true
  shared_ir_name = "MAIN-PRDO"
  rg_tf_name  = "RG-TOTAL-TF-MGT-TG-P"
  akv_tf_name = "akv-tf-dv-ne-<projectName>"
  ```

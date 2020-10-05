# Module AzureNetwork DDoS Protection Plan

## Description

Manages an AzureNetwork DDoS Protection Plan.

## Usage

### Module Definitions

- module location : providers/azure/NetworkDdosProtectionPlan

```hcl
  module "andpl" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkDdosProtectionPlan/"
  project_resource_group_name = var.project_resource_group_name
  andpl_name                  = var.andpl_name
  resource_deploy             = var.resource_deploy
  }
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the network Ddos protection plan should be exist. Changing this forces a new resource to be created."
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "andpl_name" {
  type        = string
  description = "(Required) Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "andpl_id" {
  value       = module.andpl.andpl_id
  description = "The ID of the DDoS Protection Plan"
}

output "andpl_virtual_network_ids" {
  value       = module.andpl.andpl_virtual_network_ids
  description = "A list of Virtual Network ID's associated with the DDoS Protection Plan."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  rg_name     = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  rg_name     = "RG-TOTAL-WU-GEORGE-P"
  ```

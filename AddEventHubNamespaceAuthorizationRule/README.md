# Module AddEventHubNamespaceAuthorizationRule
`The development of this module is currently in progress`

## Description
This module adds and EventHub Namespace AuthorizationRule

## Usage
### Module Definitions

- module location : providers/azure/AddEventHubNamespaceAuthorizationRule

```hcl 
  module "aehar" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHubNamespaceAuthorizationRule/"
  aehar_name                  = var.aehar_name
  aehar_namespace_name        = element(module.aehn.aehn_name, 0)
  project_resource_group_name = var.project_resource_group_name
  aehar_listen                = var.aehar_listen
  aehar_send                  = var.aehar_send
  aehar_manage                = var.aehar_manage
  resource_deploy             = var.resource_deploy
  resource_depends_on         = var.resource_depends_on
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventHub Namespace exists. Changing this forces a new resource to be created."
}

variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "short_project_name" {
  type        = string
  description = "Project name"
}

variable "aehn_sku" {
  type        = string
  description = "Required Defines which tier to use. Valid options are Basic and Standard"
  default     = "Standard"
}

variable "aehn_capacity" {
  type        = number
  description = "Optional Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
}

variable "aehn_auto_inflate_enabled" {
  type        = bool
  description = "Optional Is Auto Inflate enabled for the EventHub Namespace"
}

variable "aehn_maximum_throughput_units" {
  type        = number
  description = "Optional Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aehar_name" {
  type        = string
  description = "(Required) Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
}

variable "aehar_listen" {
  type        = string
  description = "(Optional) Grants listen access to this this Authorization Rule. Defaults to false."
  default     = false
}

variable "aehar_send" {
  type        = string
  description = "(Optional) Grants send access to this this Authorization Rule. Defaults to false."
  default     = false
}

variable "aehar_manage" {
  type        = string
  description = "(Optional) Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false."
  default     = false
}

variable "resource_depends_on" {
  type        = any
  default     = null
}
```


## Outputs
The following variables are available as module outputs variables


```
output "aehar_id" {
  value       = module.aehar.aehar_id
  description = "The EventHub Namespace Authorization Rule ID."
}

output "aehar_primary_key" {
  value       = module.aehar.aehar_primary_key
  description = "The Primary Key for the Authorization Rule."
}

output "aehar_primary_connection_string" {
  value       = module.aehar.aehar_primary_connection_string
  description = "The Primary Connection String for the Authorization Rule."
}

output "aehar_secondary_key" {
  value       = module.aehar.aehar_secondary_key
  description = "The Secondary Key for the Authorization Rule."
}

output "aehar_secondary_connection_string" {
  value       = module.aehar.aehar_secondary_connection_string
  description = "The Secondary Connection String for the Authorization Rule."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
        project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
    ```
* example for `p` environment :
    ```hcl
        project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
    ```
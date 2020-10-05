# Module AutomationAccount

## Description

This module manages a Automation Account.

## Usage

### Module Definitions

- module location : providers/azure/AutomationAccount

```
module "aaa" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AutomationAccount/"
  project_resource_group_name = var.project_resource_group_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  aaa_sku_name                = var.aaa_sku_name
  resource_deploy             = var.resource_deploy
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created."
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aaa_sku_name" {
  type        = string
  description = "(Optional) The SKU name of the account - only Basic is supported at this time."
  default     = "Basic"
}

```

## Outputs

The following variables are available as module outputs variables

```
output "aaa_id" {
  value       = module.aaa.aaa_id
  description = "id - The Automation Account ID."
}
output "aaa_name" {
  value       = module.aaa.aaa_name
  description = "The Automation Account Name"
}
output "aaa_dsc_server_endpoint" {
  value       = module.aaa.aaa_dsc_server_endpoint
  description = "The DSC Server Endpoint associated with this Automation Account."
}

output "aaa_dsc_primary_access_key" {
  value       = module.aaa.aaa_dsc_primary_access_key
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account"
}

output "aaa_dsc_secondary_access_key" {
  value       = module.aaa.aaa_dsc_secondary_access_key
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  ```

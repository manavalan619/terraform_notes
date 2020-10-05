# Module AppServicePlan

`The development of this module is currently in progress`

## Description

This module creates an Azure App Service Plan

## Usage

### Module Definitions

- module location : providers/azure/AppServicePlan

```hcl
module "aasp" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AppServicePlan/"
  project_resource_group_name   = var.project_resource_group_name
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  aasp_sku_tier                 = var.aasp_sku_tier
  aasp_sku_size                 = var.aasp_sku_size
  aasp_sku_capacity             = var.aasp_sku_capacity
  aasp_kind                     = var.aasp_kind
  aasp_max_elastic_worker_count = var.aasp_max_elastic_worker_count
  resource_deploy               = var.resource_deploy
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
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
variable "aasp_sku_tier" {
  type        = string
  description = "Required Specifies the plan's pricing tier."
}
variable "aasp_sku_size" {
  type        = string
  description = "Required Specifies the plan's instance size."
}
variable "aasp_sku_capacity" {
  type        = number
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}
variable "aasp_kind" {
  type        = string
  description = "Optional The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). types to Windows. Changing this forces a new resource to be created."
  default     = "Windows"
}
variable "aasp_max_elastic_worker_count" {
  type        = number
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  default     = 1
}
```

## Outputs

The following variables are available as module outputs variables

```
output "aasp_id" {
  value       = module.aasp.aasp_id
  description = "The App Service Plan ID."
}
output "aasp_maximum_number_of_workers" {
  value       = module.aasp.aasp_maximum_number_of_workers
  description = "The maximum number of workers supported with the App Service Plan's sku."
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

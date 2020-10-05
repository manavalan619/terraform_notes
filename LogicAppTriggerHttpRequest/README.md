# Module Logic App Trigger Http Request

## Description

This module creates an Azure Logic App Trigger Http Request

## Usage

### Module Definitions

- module location : providers/azure/LogicAppTriggerHttpRequest

```hcl
module "alathr" {
  resource_deploy             = var.resource_deploy
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppTriggerHttpRequest/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  resource_index              = var.resource_index
  location_code               = var.location_code
  alaw_name                   = azurerm_logic_app_workflow.alaw.name
  alathr_schema               = var.alathr_schema
  alathr_method               = var.alathr_method
  alathr_relative_path        = var.alathr_relative_path
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Logic App workflow should exist. Changing this forces a new resource to be created."
}
variable "alaw_name" {
  type        = string
  description = "(Required) The name of the Logic App Workflow."
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
variable "resource_index" {
  type        = number
  description = "Resource Index"
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "alathr_schema" {
  type        = string
  description = "(Required) A JSON Blob defining the Schema of the incoming request."
}
variable "alathr_method" {
  type        = string
  description = "(Optional) Specifies the HTTP Method which the request be using. Possible values include DELETE, GET, PATCH, POST or PUT."
  default     = "GET"
}
variable "alathr_relative_path" {
  type        = string
  description = "(Optional) Specifies the Relative Path used for this Request."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
```

## Outputs

The following variables are available as module outputs variables

```
output "alathr_id" {
  value       = module.alathr.alathr_id
  description = "The ID of the HTTP Request Trigger within the Logic App Workflow."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  project_resource_group_name = "RG-TOTAL-WU-GEORGE-DV"
- example for `p` environment :
  project_resource_group_name = "RG-TOTAL-WU-GEORGE-P"

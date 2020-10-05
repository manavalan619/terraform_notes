# Module AutomationRunbook

## Description

This module manages a Automation Runbook.

## Usage

### Module Definitions

- module location : providers/azure/AutomationRunbook

```
module "aar" {
  source                      = "../../AutomationRunbook/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
  aaa_name                    = length(module.aaa.aaa_name) > 0 ? element(module.aaa.aaa_name, 0) : ""
  aar_log_verbose             = var.aar_log_verbose
  aar_log_progress            = var.aar_log_progress
  aar_description             = var.aar_description
  aar_runbook_type            = var.aar_runbook_type
  aar_uri                     = var.aar_uri
  aar_local_file_name         = var.aar_local_file_name
  resource_deploy             = var.resource_deploy
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Runbook is created. Changing this forces a new resource to be created."
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
variable "aar_log_verbose" {
  type        = string
  description = "(Required) Verbose log option."
}

variable "aar_log_progress" {
  type        = string
  description = "(Required) Progress log option."
}

variable "aar_description" {
  type        = string
  description = "(Optional) A description for this credential."
  default     = ""
}
variable "aar_runbook_type" {
  type        = string
  description = "(Optional) A description for this credential."
  default     = ""
}
variable "aar_uri" {
  type        = string
  description = "(Required) The published runbook content link."
}
variable "aar_local_file_name" {
  type        = string
  description = "(Optional) The desired content of the runbook."
  default     = null
}


```

## Outputs

The following variables are available as module outputs variables

```
output "aar_id" {
  value       = module.aar.aar_id
  description = "The Automation Runbook ID."
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

# Module LogicAppTriggerRecurrence

## Description

This module creates an Azure Logic App Trigger Recurrence

## Usage

### Module Definitions

- module location : providers/azure/LogicAppTriggerRecurrence

```
module "alatr" {
  resource_deploy             = var.resource_deploy
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppTriggerRecurrence/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  alaw_name                   = azurerm_logic_app_workflow.alaw.name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  resource_index              = var.resource_index
  location_code               = var.location_code
  alatr_frequency             = var.alatr_frequency
  alatr_interval              = var.alatr_interval
  alatr_start_time            = var.alatr_start_time
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
variable "alatr_frequency" {
  type        = string
  description = "(Required) Specifies the Frequency at which this Trigger should be run. Possible values include Month, Week, Day, Hour, Minute and Second."
  default     = "Day"
}
variable "alatr_interval" {
  type        = number
  description = "(Required) Specifies interval used for the Frequency, for example a value of 4 for interval and hour for frequency would run the Trigger every 4 hours."
  default     = 4
}
variable "alatr_start_time" {
  type        = string
  description = "(Optional) Specifies the start date and time for this trigger in RFC3339 format."
  default     = "2000-01-02T03:04:05Z"
}
variable "resource_depends_on" {
  type    = any
  default = null
}
```

## Outputs

The following variables are available as module outputs variables

```
output "alatr_id" {
  value       = module.alatr.alatr_id
  description = "The ID of the Recurrence Trigger within the Logic App Workflow"
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  project_resource_group_name = "RG-TOTAL-WU-GEORGE-DV"
- example for `p` environment :
  project_resource_group_name = "RG-TOTAL-WU-GEORGE-P"

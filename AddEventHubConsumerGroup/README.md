# Module AddEventHubConsumerGroup

`The development of this module is currently in progress`

## Description

This module manages a Event Hubs Consumer Group as a nested resource within an Event Hub.

## Usage

### Module Definitions

- module location : providers/azure/AddEventHubConsumerGroup

```hcl
module "aehcg" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHubConsumerGroup"
  project_resource_group_name = var.project_resource_group_name
  aehcg_namespace_name        = var.aehcg_namespace_name
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  resource_index              = var.resource_index
  location_code               = var.location_code
  aehcg_eventhub_name         = var.aehcg_eventhub_name
  aehcg_user_metadata         = var.aehcg_user_metadata
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventHub Consumer Group's grandparent Namespace exists. "
}
variable "aehn_name" {
  type        = string
  description = "(Required) Specifies the name of the grandparent EventHub Namespace. Changing this forces a new resource to be created."
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
  type        = string
  description = "Resource index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
}
variable "aehcg_namespace_name" {
  type        = string
  description = "(Required) Specifies the name of the grandparent EventHub Namespace. Changing this forces a new resource to be created."
}
variable "aehcg_eventhub_name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub. Changing this forces a new resource to be created."
}
variable "aehcg_user_metadata" {
  type        = string
  description = "(Optional) Specifies the user metadata."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
```

## Outputs

The following variables are available as module outputs variables

```
output "aehcg_id" {
  value       = module.aehcg.aehcg_id
  description = "Event Hub Consumer Group ID."
}
output "aehcg_name" {
  value       = module.aehcg.aehcg_name
  description = "Event Hub Consumer Group Name."
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

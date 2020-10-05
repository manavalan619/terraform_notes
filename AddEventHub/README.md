# Module EventHub

`The development of this module is currently in progress`

## Description

This module creates an Azure EventHub

## Usage

### Module Definitions

- module location : providers/azure/EventHub

```hcl
module "aeh" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHub"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  aehn_name                   = length(module.aehn.aehn_name) > 0 ? element(module.aehn.aehn_name, 0) : ""
  aeh_name                    = var.aeh_name
  aeh_partition_count         = var.aeh_partition_count
  aeh_message_retention       = var.aeh_message_retention
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
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

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

variable "resource_index" {
  type        = string
  description = "Resource index for the event hub namespace"
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
variable "aeh_name" {
  type        = string
  description = "name of the EventHub resource"
}
variable "aeh_partition_count" {
  type        = number
  description = "Required Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created"
  default     = 2
}
variable "aeh_message_retention" {
  type        = number
  description = "Required Specifies the number of days to retain the events for this Event Hub. Needs to be between 1 and 7 days; or 1 day when using a Basic SKU for the parent EventHub Namespace."
  default     = 7
}
```

## Outputs

The following variables are available as module outputs variables

```
output "aeh_id" {
  value       = module.aeh.aeh_id
  description = "Event Hub Id."
}
output "aeh_name" {
  value       = module.aeh.aeh_name
  description = "Event Hub Name."
}
output "aeh_partition_ids" {
  value       = module.aeh.aeh_partition_ids
  description = "The identifiers for partitions created for Event Hubs."
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

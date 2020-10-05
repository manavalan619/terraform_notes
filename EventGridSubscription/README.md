# Module EventGrid Event Subscription

## Description
This module creates an Azure event grid domain

## Usage
### Module Definitions

- module location    : providers/azure/EventGridSubscription

```hcl
module "aeges" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/EventGridSubscription/"
  project_resource_group_name = var.project_resource_group_name
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  env_code                    = var.env_code
  resource_deploy             = var.resource_deploy
  asa_name                    = length(module.asa.asa_name) > 0 ? element(module.asa.asa_name, 0) : ""
  asq_name                    = length(module.asq.asq_name) > 0 ? element(module.asq.asq_name, 0) : ""
  aeges_event_delivery_schema = var.aeges_event_delivery_schema
  aeges_subject_begins_with   = var.aeges_subject_begins_with
  aeges_subject_ends_with     = var.aeges_subject_ends_with
  aeges_max_delivery_attempts = var.aeges_max_delivery_attempts
  aeges_event_time_to_live    = var.aeges_event_time_to_live
}
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "Required) The name of the resource group in which the EventGrid Domain exists. Changing this forces a new resource to be created."
}

variable "asa_account_tier" {
  type        = string
  description = "Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "asa_account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "asa_kind" {
  type        = string
  description = "Optional Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to Storage."
}

variable "asa_access_tier" {
  type        = string
  description = "Optional Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  default     = "Hot"
}

variable "asa_enable_https_traffic_only" {
  type        = bool
  description = "Optional Boolean flag which forces HTTPS if enabled"
}

variable "asa_is_hns_enabled" {
  description = "Optional Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2"
  type        = bool
  default     = false
}

variable "resource_index" {
  type        = number
  description = "Resource index for the Storage Queue"
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

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aeges_event_delivery_schema" {
  type        = string
  description = " (Optional) Specifies the event delivery schema for the event subscription. Possible values include: EventGridSchema, CloudEventSchemaV1_0, CustomInputSchema. Defaults to EventGridSchema. Changing this forces a new resource to be created."
}


variable "aeges_subject_begins_with" {
  type        = string
  description = "(Optional) A string to filter events for an event subscription based on a resource path prefix."
}

variable "aeges_subject_ends_with" {
  type        = string
  description = "(Optional) A string to filter events for an event subscription based on a resource path suffix."
}

variable "aeges_max_delivery_attempts" {
  type        = number
  description = "(Required) Specifies the maximum number of delivery retry attempts for events."
}

variable "aeges_event_time_to_live" {
  type        = number
  description = "(Required) Specifies the time to live (in minutes) for events."
}
```

## Outputs
The following variables are available as module outputs variables


```
output "aeges_name" {
  value       = module.aeges.aeges_name
  description = "The Name of the EventGrid Event Subscription."
}

output "aeges_id" {
  value       = module.aeges.aeges_id
  description = "The ID of the EventGrid Event Subscription."
}

output "asa_name" {
  value       = module.asa.asa_name
  description = "The Storage Account Name."
}

output "asq_name" {
  value       = module.asq.asq_name
  description = "The Storage Queue Name."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-DV"
    aegd_name = "tfex-eventgridsubscription-tf-dv-we-<myProjectName>"
    ```
* example for `p` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-P"
    aegd_name = "tfex-eventgridsubscription-tf-p-we-<myProjectName>"   ```

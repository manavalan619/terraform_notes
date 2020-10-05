# Module StorageAccount

`The development of this module is currently in progress`

## Description

This module creates an Azure Storage Account

## Usage

### Module Definitions

- module location : providers/azure/StorageAccount

```hcl
module "asa" {
  source                        = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageAccount"
  project_resource_group_name   = var.project_resource_group_name
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  asa_kind                      = var.asa_kind
  asa_account_tier              = var.asa_account_tier
  asa_enable_https_traffic_only = var.asa_enable_https_traffic_only
  resource_deploy               = var.resource_deploy
  asa_account_replication_type  = var.asa_account_replication_type
  asa_access_tier               = var.asa_access_tier
  asa_is_hns_enabled            = var.asa_is_hns_enabled
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
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

```

## Outputs

The following variables are available as module outputs variables

```
output "asa_name" {
  value       = module.asa.asa_name
  description = "The Storage Account Name."
}
output "asa_id" {
  value       = module.asa.asa_id
  description = "The Storage Account ID."
}
output "asa_connection_string" {
  value       = module.asa.asa_connection_string
  description = "The connection string associated with the primary location."
}
output "asa_primary_blob_connection_string" {
  value       = module.asa.asa_primary_blob_connection_string
  description = "The connection string associated with the primary blob location."
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

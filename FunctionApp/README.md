# Module FunctionApp

`The development of this module is currently in progress`

## Description

This module creates an Azure Function App

## Usage

### Module Definitions

- module location : providers/azure/FunctionApp

```hcl
module "afa" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/FunctionApp"
  project_resource_group_name = module.rg.project_resource_group_name
  afa_aasp_id                 = module.aasp.aasp_id[0]
  afa_asa_connection_string   = module.asa.asa_connection_string[0]
  afa_app_settings            = var.afa_app_settings
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Function App."
}
variable "resource_depends_on" {
  type    = any
  default = null
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
variable "resource_index" {
  type        = string
  description = "Resource Index"
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "asa_name" {
  type        = string
  description = "Required Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}
variable "aasp_name" {
  type        = string
  description = "(Required) Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}
variable "aasp_sku_tier" {
  type        = string
  description = "(Required) Specifies the plan's pricing tier."
}
variable "aasp_sku_size" {
  type        = string
  description = "(Required) Specifies the plan's instance size."
}
variable "asa_enable_https_traffic_only" {
  type        = bool
  description = "(Optional) Boolean flag which forces HTTPS if enabled"
}
variable "asa_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to Storage."
}

variable "location" {
  description = "The Azure Region in which the resources should be deployed"
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  type        = map(string)
}
variable "afa_app_settings" {
  type        = map
  description = "Optional A key-value pair of App Settings."
}

```

## Outputs

The following variables are available as module outputs variables

```
output "asa_id" {
  value       = module.asa.asa_id
  description = "The Storage Account ID."
}
output "asa_connection_string" {
  value       = module.asa.asa_connection_string
  description = "The Storage Account Connection String."
}

output "aasp_id" {
  value       = module.aasp.aasp_id
  description = "The App Service Plan ID."
}

output "afa_site_credential" {
  value       = module.afa.afa_site_credential
  description = "A site_credential block, which contains the site-level credentials used to publish to this App Service."
}

output "afa_identity_id" {
  value       = module.afa.afa_identity_id
  description = "An identity block, which contains the Managed Service Identity information for this App Service."
}

output "project_resource_group_name" {
  value       = module.rg.project_resource_group_name
  description = " The name of the Resource Group."
}

output "project_resource_group_location" {
  value       = module.rg.project_resource_group_location
  description = " The location of the Resource Group."

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

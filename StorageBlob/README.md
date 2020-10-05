# Module Storage Blob

`The development of this module is currently in progress`

## Description

This module creates an Storage Blob

## Usage

### Module Definitions

- module location : providers/azure/StorageBlob

  ```hcl
  module "asb" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageBlob/"
  project_resource_group_name = var.project_resource_group_name
  resource_deploy             = var.resource_deploy
  asa_name                    = var.asa_name
  asc_name                    = var.asc_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
  asb_type                    = var.asb_type
  }

  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StorageBlob Services Server should be exist. Changing this forces a new resource to be created."
}
variable "asa_name" {
  type        = string
  description = "(Required) The name of the Storage Account where the Container should be created."
}
variable "asc_name" {
  type        = string
  description = "(Required) The name of the Container which should be created within the Storage Account."
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
  type        = number
  description = "Resource index"
}
variable "asb_type" {
  type        = string
  description = "(Required) The type of the storage blob to be created. Possible values are Append, Block or Page."
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "asb_id" {
  value       = module.asb.asb_id
  description = "The ID of the Storage Blob."
}
output "asb_url" {
  value       = module.asb.asb_url
  description = "The URL of the Storage Blob"
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
     rg_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
     rg_name  = "RG-TOTAL-WU-GEORGE-P"
  ```

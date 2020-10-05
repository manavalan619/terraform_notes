# Module StorageContainer

`The development of this module is currently in progress`

## Description

This module creates an Storage Container

## Usage

### Module Definitions

- module location : providers/azure/StorageContainer

  ````hcl
  module "asc" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageContainer/"
  project_resource_group_name = var.project_resource_group_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_deploy             = var.resource_deploy
  resource_index              = var.resource_index
  asa_name                    = var.asa_name
  asc_container_access_type   = var.asc_container_access_type
  }
    ```
  ````

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StorageContainer Services Server should be exist. Changing this forces a new resource to be created."
}
variable "asa_name" {
  type        = string
  description = "(Required) The name of the Storage Account where the Container should be created."
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
variable "asc_container_access_type" {
  type        = string
  description = "(Optional) The Access Level configured for this Container"
  default     = ""
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
output "asc_id" {
  value       = module.asc.asc_id
  description = "The ID of the Storage Container."
}
output "asc_name" {
  value       = module.asc.asc_name
  description = "Storage Account Name"
}
output "asc_has_immutability_policy" {
  value       = module.asc.asc_has_immutability_policy
  description = "Is there an Immutability Policy configured on this Storage Container?"
}
output "asc_has_legal_hold" {
  value       = module.asc.asc_has_legal_hold
  description = "Is there a Legal Hold configured on this Storage Container?"
}
output "asc_resource_manager_id" {
  value       = module.asc.asc_resource_manager_id
  description = "The Resource Manager ID of this Storage Container."
}

```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  asa_name = "azurerm_storage_account-tf-dv-we-<myProjectName>"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  asa_name = "azurerm_storage_account-tf-p-we-<myProjectName>"
  ```
# Module KeyVault

## Description

This module creates an Azure Key Vault

## Usage

### Module Definitions

- module location : providers/azure/KeyVault

```hcl
module "akv" {
  source                              = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVault/"
  project_resource_group_name         = var.project_resource_group_name
  short_project_name                  = var.short_project_name
  location_code                       = var.location_code
  akv_sku_name                        = var.akv_sku_name
  project_name                        = var.project_name
  akv_enabled_for_deployment          = var.akv_enabled_for_deployment
  akv_enabled_for_template_deployment = var.akv_enabled_for_template_deployment
  akv_soft_delete_enabled             = var.akv_soft_delete_enabled
  akv_purge_protection_enabled        = var.akv_purge_protection_enabled
  env_code                            = var.env_code
  resource_deploy                     = var.resource_deploy
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Key Vault should be exist. Changing this forces a new resource to be created."
}

variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project name"
}

variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
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
variable "akv_sku_name" {
  type        = string
  description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}
variable "akv_access_policy_security_level" {
  type        = string
  description = "(Required) It will be : Owner, Writer or Reader"
  default     = "Owner"
}
variable "akv_enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  default     = true
}
variable "akv_soft_delete_enabled" {
  type        = bool
  description = "(Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false."
  default     = true
}
variable "akv_purge_protection_enabled" {
  type        = bool
  description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
  default     = true
}
variable "akv_enabled_for_deployment" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  default     = false
}
variable "akv_enabled_for_template_deployment" {
  type        = string
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  default     = false
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "akv_id" {
  value       = module.akv.akv_id
  description = "Key Vaullt ID."
}
output "akv_vault_uri" {
  value       = module.akv.akv_vault_uri
  description = "Key Vaullt URI."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

  ```hcl
  resource_deploy = true
  akv_sku_name = "standard"
  ```

- example for `p` environment :
  ```hcl
  resource_deploy = true
  akv_sku_name = "premium"
  ```

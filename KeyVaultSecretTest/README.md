# Module KeyVaultSecret

## Description

This module creates an Azure KeyVault Access secret on an existing key vault

## Usage

### Module Definitions

- module location : providers/azure/KeyVaultSecret

```hcl
module "akv_secret" {
  source           = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVaultSecret/"
  akv_key_vault_id = var.akv_key_vault_id
  akv_secret_name  = var.akv_secret_name
  akv_secret_value = var.akv_secret_value
  akv_secret_content_type = var.akv_secret_content_type
}
```

## Inputs

In the variables.tf file [variables.tf](variables.tf).

```hcl
variable "akv_secret_name" {
  type        = string
  description = "(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}
variable "akv_secret_value" {
  type        = string
  description = "(Required) Specifies the value of the Key Vault Secret."
}
variable "akv_key_vault_id" {
  type        = list(string)
  description = "(Required) Azure Key Vault id where secret will be create and store."
  default     = []
}
variable "akv_secret_content_type" {
  type        = string
  description = "(Optional) Specifies the content type for the Key Vault Secret."
  default     = null
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "akv_secret_id" {
  value       = module.akv_secret.akv_secret_id
  description = "Key Vault Secret ID."
}
output "akv_secret_version" {
  value       = module.akv_secret.akv_secret_version
  description = "Key Vault Secret Version."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  akv_secret_name="secret-dv"
  ```
- example for `p` environment :

  ```hcl
  akv_secret_name="secret-p"
  ```
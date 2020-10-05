# Module KeyVaultAccessPolicy

## Description

This module creates an Azure KeyVault Access Policy on an existing key vault

## Usage

### Module Definitions

- module location : providers/azure/KeyVaultAccessPolicy

```hcl
module "akv_access_policy" {
  source                           = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVaultAccessPolicy/"
  akv_access_policy_key_vault_id   = length(module.akv.akv_id) > 0 ? element(module.akv.akv_id, 0) : ""
  akv_access_policy_object_ids     = var.akv_access_policy_object_ids
  akv_access_policy_security_level = var.akv_access_policy_security_level
  resource_depends_on              = var.resource_depends_on
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "tags" {
  type = map
}
variable "akv_access_policy_object_ids" {
  type = list(string)
}
variable "akv_access_policy_security_level" {
  type = string
}
variable "resource_depends_on" {
  type    = any
  default = null
}

```

## Outputs

The following variables are available as module outputs variables

```hcl
output "akv_id" {
    value = module.akv.akv_id
}
output "akv_vault_uri" {
    value = module.akv.akv_vault_uri
}
```

## Example variables values in env.tfvars for each env

`there is only one variable to set in global.tfvars`

## Example variables values in global.tfvars file (see below)

    ```hcl
    akv_access_policy_security_level = "Reader"
    ```

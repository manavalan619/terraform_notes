# Module CosmoSQLDbContainer

`The development of this module is currently in progress`

## Description

This module manages a SQL Container in a CosmosDB SQL Database (SQL API)

## Usage

### Module Definitions

- module location : providers/azure/AddContainerToCosmosDbSqlDb

  ```hcl
  module "acsc" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddContainerToCosmosDbSqlDb"
  project_resource_group_name = var.project_resource_group_name
  acsc_name                   = var.acsc_name
  acsc_account_name           = var.acsc_account_name
  acsc_database_name          = var.acsc_database_name
  acsc_partition_key_path     = var.acsc_partition_key_path
  acsc_unique_key_paths       = var.acsc_unique_key_paths
  acsc_throughput             = var.acsc_throughput
  acsc_default_ttl            = var.acsc_default_ttl
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
  }
  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Cosmos DB SQL Database is created. Changing this forces a new resource to be created."
}
variable "acsc_name" {
  type        = string
  description = "(Required) Specifies the name of the Cosmos DB SQL Database. Changing this forces a new resource to be created."
}
variable "acsc_account_name" {
  type        = string
  description = "(Required) The name of the Cosmos DB Account to create the container within. Changing this forces a new resource to be created."
}
variable "acsc_database_name" {
  type        = string
  description = "(Required) The name of the Cosmos DB SQL Database to create the container within. Changing this forces a new resource to be created."
}
variable "acsc_partition_key_path" {
  type        = string
  description = "(Optional) Define a partition key. Changing this forces a new resource to be created."
}
variable "acsc_unique_key_paths" {
  type        = list(string)
  description = "(Required) A list of paths to use for this unique key."
  default     = []
}
variable "acsc_throughput" {
  type        = number
  description = "(Optional) The throughput of SQL container (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon container creation otherwise it cannot be updated without a manual terraform destroy-apply."
  default     = 1000
}
variable "acsc_default_ttl" {
  type        = number
  description = "(Optional) The default time to live of SQL container. If missing, items are not expired automatically. If present and the value is set to -1, it is equal to infinity, and items don’t expire by default. If present and the value is set to some number n – items will expire n seconds after their last modified time."
  default     = -1
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

```hcl
output "acsc_id" {
  value = module.acsc.acsc_id
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

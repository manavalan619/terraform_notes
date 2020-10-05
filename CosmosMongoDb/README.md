# Module CosmosMongoDb

`The development of this module is currently in progress`

## Description

This module creates an Azure Cosmos Mongo DB

## Usage

### Module Definitions

- module location : providers/azure/CosmosMongoDb

  ```hcl
  module "acdb_mongo_db" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/CosmosMongoDb/"
  project_resource_group_name = var.project_resource_group_name
  acdb_name                   = var.acdb_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
  acdb_mongo_db_throughput    = var.acdb_mongo_db_throughput
  resource_deploy             = var.resource_deploy
  resource_depends_on         = var.resource_depends_on
  }
  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Cosmos DB Mongo Database is created. Changing this forces a new resource to be created."
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
  description = "Resource Index"
}
variable "acdb_name" {
  type        = string
  description = "(Required) Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
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
variable "acdb_mongo_db_throughput" {
  type        = number
  description = "(Optional) The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "acdb_mongo_db_id" {
  value       = module.acdb_mongo_db.acdb_mongo_db_id
  description = "Cosmos DB Mongo Database ID."
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

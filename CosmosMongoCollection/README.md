# Module CosmosMongoCollection

`The development of this module is currently in progress`

## Description

This module creates an Azure Cosmos Mongo DB Collection

## Usage

### Module Definitions

- module location : providers/azure/CosmosMongoCollection

```hcl
module "acdb_mongo_collection" {
  source                                    = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/CosmosMongoCollection/"
  project_resource_group_name               = var.project_resource_group_name
  acdb_name                                 = var.acdb_name
  project_name                              = var.project_name
  env_code                                  = var.env_code
  short_project_name                        = var.short_project_name
  location_code                             = var.location_code
  resource_index                            = var.resource_index
  acdb_mongo_collection_default_ttl_seconds = var.acdb_mongo_collection_default_ttl_seconds
  acdb_mongo_collection_shard_key           = var.acdb_mongo_collection_shard_key
  acdb_mongo_collection_throughput          = var.acdb_mongo_collection_throughput
  acdb_mongo_db_name                        = var.acdb_mongo_db_name
  resource_deploy                           = var.resource_deploy
  resource_depends_on                       = var.resource_depends_on
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the CosmosMongoCollection Services Server should be exist. Changing this forces a new resource to be created."
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
  type        = number
  description = "Resource Index"
}
variable "acdb_name" {
  type        = string
  description = "(Required) Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
}
variable "acdb_mongo_db_name" {
  type        = string
  description = "(Required) Specifies the name of the Cosmos DB Mongo Database."
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "acdb_mongo_collection_default_ttl_seconds" {
  type        = string
  description = "(Required) The default Time To Live in seconds. If the value is -1 items are not automatically expired. Provide 0 to disable"
}
variable "acdb_mongo_collection_shard_key" {
  type        = string
  description = "(Required) The name of the key to partition on for sharding. There must not be any other unique index keys."
}
variable "acdb_mongo_collection_throughput" {
  type        = number
  description = "(Optional) The throughput of the MongoDB collection. Minimum value = 400 ; Must be set in increments of 100."
  default     = 400
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "acdb_collection_id" {
  value       = module.acdb_mongo_collection.acdb_mongo_collection_id
  description = "Cosmos DB Mongo Collection ID."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  acdb_mongo_db_name = "tfex-cosmos-mongo-db-tf-dv-we-<myProjectName>"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  acdb_mongo_db_name = "tfex-cosmos-mongo-db-tf-p-we-<myProjectName>"
  ```

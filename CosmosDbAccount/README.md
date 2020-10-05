# Module CosmosDbAccount

`The development of this module is currently in progress`

## Description

This module creates an Azure Cosmos DB

## Usage

### Module Definitions

- module location : providers/azure/CosmosDbAccount

  ```hcl
  module "acdb" {
  source                                 = "../../CosmosDbAccount"
  project_resource_group_name            = var.project_resource_group_name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  location_code                          = var.location_code
  acdb_offer_type                        = var.acdb_offer_type
  acdb_kind                              = var.acdb_kind
  acdb_consistency_level                 = var.acdb_consistency_level
  acdb_enable_automatic_failover         = var.acdb_enable_automatic_failover
  acdb_max_interval_in_seconds           = var.acdb_max_interval_in_seconds
  acdb_max_staleness_prefix              = var.acdb_max_staleness_prefix
  acdb_primary_failover_priority         = var.acdb_primary_failover_priority
  acdb_primary_failover_location         = var.acdb_primary_failover_location
  acdb_secondary_failover_priority       = var.acdb_secondary_failover_priority
  acdb_capabilities_name                 = var.acdb_capabilities_name
  acdb_is_virtual_network_filter_enabled = var.acdb_is_virtual_network_filter_enabled
  acdb_enable_multiple_write_locations   = var.acdb_enable_multiple_write_locations
  acdb_network_rule_subnets              = var.acdb_network_rule_subnets
  }

  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the CosmosDbAccount Services Server should be exist. Changing this forces a new resource to be created."
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
variable "acdb_offer_type" {
  type        = string
  description = "(Required) Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  default     = "Standard"
}
variable "acdb_kind" {
  type        = string
  description = "(Optional) Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."
  default     = "GlobalDocumentDB"
}
variable "acdb_enable_automatic_failover" {
  type        = bool
  description = "(Optional) Enable automatic fail over for this Cosmos DB account."
  default     = true
}
variable "acdb_consistency_level" {
  type        = string
  description = "(Required) Specifies a consistency_policy resource, used to define the consistency level for this CosmosDB account."
  default     = "BoundedStaleness"
}
variable "acdb_max_interval_in_seconds" {
  type        = number
  description = "(Required) Specifies a consistency_policy resource, used to define the max_interval_in_seconds for this CosmosDB account."
  default     = 300
}
variable "acdb_max_staleness_prefix" {
  type        = number
  description = "(Required) Specifies a consistency_policy resource, used to define the max_staleness_prefix for this CosmosDB account."
  default     = 100000
}
variable "acdb_primary_failover_priority" {
  type        = number
  description = "(Required) The failover priority of the region."
}
variable "acdb_primary_failover_location" {
  type        = string
  description = "(Required) The name of the Azure region to host replicated data."
  default     = "North Europe"
}
variable "acdb_secondary_failover_priority" {
  type        = number
  description = "(Required) The failover priority of the region."
}
variable "acdb_capabilities_name" {
  type        = string
  description = "(Optional) The capabilities which should be enabled for this Cosmos DB account. Possible values are EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableTable, MongoDBv3.4, and mongoEnableDocLevelTTL"
}
variable "acdb_is_virtual_network_filter_enabled" {
  type        = bool
  description = "(Optional) Enables virtual network filtering for this Cosmos DB account."
  default     = false
}
variable "acdb_enable_multiple_write_locations" {
  type        = bool
  description = "(Optional) Enable multi-master support for this Cosmos DB account."
  default     = false
}
variable "acdb_network_rule_subnets" {
  type        = string
  description = "(Optional) Specifies a virtual_network_rules resource, used to define which subnets are allowed to access this CosmosDB account."
  default     = null
}

```

## Outputs

The following variables are available as module outputs variables

```hcl
output "acdb_id" {
  value       = module.acdb.acdb_id
  description = "CosmosDb Account ID."
}
output "acdb_endpoint" {
  value       = module.acdb.acdb_endpoint
  description = "The endpoint used to connect to the CosmosDB account."
}
output "acdb_read_endpoints" {
  value       = module.acdb.acdb_read_endpoints
  description = "A list of read endpoints available for this CosmosDB account."
}
output "acdb_write_endpoints" {
  value       = module.acdb.acdb_write_endpoints
  description = "A list of write endpoints available for this CosmosDB account."
}
output "acdb_primary_master_key" {
  value       = module.acdb.acdb_primary_master_key
  description = "The Primary master key for the CosmosDB Account."
}
output "acdb_secondary_master_key" {
  value       = module.acdb.acdb_secondary_master_key
  description = "The Secondary master key for the CosmosDB Account."
}
output "acdb_primary_readonly_master_key" {
  value       = module.acdb.acdb_primary_readonly_master_key
  description = "The Primary read-only master Key for the CosmosDB Account."
}
output "acdb_secondary_readonly_master_key" {
  value       = module.acdb.acdb_secondary_readonly_master_key
  description = "The Secondary read-only master Key for the CosmosDB Account."
}
output "acdb_connection_strings" {
  value       = module.acdb.acdb_connection_strings
  description = "A list of connection strings available for this CosmosDB account. If the kind is GlobalDocumentDB, this will be empty.."
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

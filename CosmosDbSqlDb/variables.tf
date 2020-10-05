variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Cosmos DB SQL Database is created. Changing this forces a new resource to be created."
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
variable "resource_index" {
  type        = number
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
# ==============================================================================
# CosmosDB Account - Variables
# ==============================================================================
variable "acdb_name" {
  type        = string
  description = "(Required) Specifies the name of the Cosmos DB SQL Database. Changing this forces a new resource to be created."
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# CosmosDb SQL Database - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "acdb_cosmosdb_sqldb_throughput" {
  type        = number
  description = "(Optional) The throughput of SQL database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "acdb_cosmosdb_sqldb_timesout_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "acdb_cosmosdb_sqldb_timesout_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "acdb_cosmosdb_sqldb_timesout_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the CosmosDB Mongo Database."
#   default     = "5m"
# }
# variable "acdb_cosmosdb_sqldb_timesout_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the CosmosDB Mongo Database."
#   default     = "30m"
# }

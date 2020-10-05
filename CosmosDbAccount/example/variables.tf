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
# ==============================================================================
# CosmosDB Account - Variables
# ==============================================================================
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
  type        = list(string)
  description = "(Optional) Specifies a virtual_network_rules resource, used to define which subnets are allowed to access this CosmosDB account."
  default     = []
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "acdb_ip_range_filter" {
#   type        = list(string)
#   description = "(Optional) CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces."
#   default     = null
# }

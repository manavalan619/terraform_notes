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
  type        = string
  description = "Resource Index"
}
variable "resource_index_mongo_db" {
  type        = string
  description = "Resource Index"
}
# ==============================================================================
# CosmosDB Mongo Collection - Variables
# ==============================================================================
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

# variable "acdb_mongo_collection_indexes_key" {
#   type        = string
#   description = "(Required) The name of the key to use for this index."
# }
# variable "acdb_mongo_collection_indexes_unique" {
#   type        = bool
#   description = "(Required) Whether the index key should be unique."
# }

# ======================================================
# Data variables
# ======================================================
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group where the SQL server resides. Changing this forces a new resource to be created."
}
variable "avnet_name" {
  type        = string
  description = "Specifies the name of the Virtual Network."
}
variable "subnet_name" {
  type        = string
  description = "Specifies the name of the Subnet."
}
variable "sqlsrv_name" {
  type        = string
  description = "The name of the SQL Server."
}
variable "project_name" {
  type        = string
  description = "Project Name"
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
# ======================================================
# SQL Virtual Network Rule - Variables
# ======================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "asvnr_ignore_missing_vnet_service_endpoint" {
  type        = bool
  description = "(Optional) Create the virtual network rule before the subnet has the virtual network service endpoint enabled."
  default     = false
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "asvnr__timesout_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "asvnr__timesout_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "asvnr__timesout_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the CosmosDB Mongo Database."
#   default     = "5m"
# }
# variable "asvnr__timesout_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the CosmosDB Mongo Database."
#   default     = "30m"
# }


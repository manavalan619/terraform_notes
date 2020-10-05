variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the sql server."
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

# ==============================================================================
# SQL Server Firewall - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# variable "sqlsrv_name" {
#   type        = string
#   description = "(Required) The name of the SQL Server. This needs to be globally unique within Azure."
# }
variable "sqlsrv_fw_rules" {
  type = map(
    object(
      {
        name     = string
        start_ip = string
        end_ip   = string
      }
    )
  )
  default = {}
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "sqldb_fw_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the SQL Firewall Rule."
#   default     = "30m"
# }
# variable "sqldb_fw_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the SQL Firewall Rule."
#   default     = "30m"
# }
# variable "sqldb_fw_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the SQL Firewall Rule."
#   default     = "5m"
# }
# variable "sqldb_fw_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the SQL Firewall Rule."
#   default     = "30m"
# }

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the sql server."
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# SQL Server Firewall - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sqlsrv_name" {
  type        = string
  description = "(Required) The name of the SQL Server. This needs to be globally unique within Azure."
}
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

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
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
# sqlsrv Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sqlsrv_version" {
  type        = string
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}
variable "sqlsrv_administrator_login" {
  type        = string
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
}
variable "sqlsrv_ad_login" {
  type        = string
  description = "(Required) The login name of the principal to set as the server administrator"
}
variable "sqlsrv_ad_admin_group" {
  type        = string
  description = "(Required) The aad group name to set as the server administrator"
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "sqlsrv_extended_auditing_policy_storage_account_access_key" {
#   type        = string
#   description = "(Required) Specifies the access key to use for the auditing storage account."
#   default     = null
# }
# variable "sqlsrv_extended_auditing_policy_storage_endpoint" {
#   type        = string
#   description = "(Required) Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net)."
#   default     = null
# }
# variable "sqlsrv_extended_auditing_policy_storage_account_access_key_is_secondary" {
#   type        = string
#   description = "(Optional) Specifies whether storage_account_access_key value is the storage's secondary key."
#   default     = null
# }
# variable "sqlsrv_extended_auditing_policy_retention_in_days" {
#   type        = string
#   description = "(Optional) Specifies the number of days to retain logs for in the storage account."
#   default     = null
# }
# variable "sqlsrv_timeouts_create" {
#   type        = string
#   description = "(Defaults to 60 minutes) Used when creating the SQL Server."
#   default     = "60m"
# }
# variable "sqlsrv_timeouts_update" {
#   type        = string
#   description = "(Defaults to 60 minutes) Used when updating the SQL Server."
#   default     = "60m"
# }
# variable "sqlsrv_timeouts_read" {
#   type        = string
#   description = "5m"
# }
# variable "sqlsrv_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 60 minutes) Used when deleting the SQL Server."
#   default     = "60"
# }


# ==============================================================================
# sqlsrv azurerm_sql_active_directory_administrator Variables
# ==============================================================================
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "sqlsrv_asada_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the SQL Active Directory Administrator."
#   default     = "30m"
# }
# variable "sqlsrv_asada_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the SQL Active Directory Administrator."
#   default     = "30m"
# }
# variable "sqlsrv_asada_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the SQL Active Directory Administrator."
#   default     = "5m"
# }
# variable "sqlsrv_asada_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the SQL Active Directory Administrator."
#   default     = "30m"
# }

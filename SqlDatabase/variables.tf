variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
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
  type        = string
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
}

# ==============================================================================
# SQL Server - Variables
# ==============================================================================
variable "sqlsrv_version" {
  type        = string
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}
variable "sqlsrv_administrator_login" {
  type        = string
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
  default     = ""
}
variable "sqlsrv_ad_login" {
  type        = string
  description = "(Required) The login name of the principal to set as the server administrator"
  default     = ""
}
variable "sqlsrv_ad_admin_group" {
  type        = string
  description = "(Required) The aad groupb name to set as the server administrator"
  default     = ""
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

# ==============================================================================
# SQL Firewall - Variables
# ==============================================================================
variable "resource_deploy_fw" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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
  default = null
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

# ==============================================================================
# SQL Database - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "sqldb_create_mode" {
#   type        = string
#   description = "(Optional) Specifies how to create the database. Valid values are: Default, Copy, OnlineSecondary, NonReadableSecondary, PointInTimeRestore, Recovery, Restore or RestoreLongTermRetentionBackup. Must be Default to create a new database. Defaults to Default."
#   default     = "Default"
# }
# // Optional "import" block
# variable "sqldb_import_storage_uri" {
#   type        = string
#   description = "(Required) Specifies the blob URI of the .bacpac file."
#   default     = null
# }
# variable "sqldb_import_storage_key" {
#   type        = string
#   description = "(Required) Specifies the access key for the storage account."
#   default     = null
# }
# variable "sqldb_import_storage_key_type" {
#   type        = string
#   description = "(Required) Specifies the type of access key for the storage account. Valid values are StorageAccessKey or SharedAccessKey."
#   default     = null
# }
# variable "sqldb_import_administrator_login" {
#   type        = string
#   description = "(Required) Specifies the name of the SQL administrator."
#   default     = null
# } 
# variable "sqldb_import_administrator_login_password" {
#   type        = string
#   description = "(Required) Specifies the password of the SQL administrator."
#   default     = null
# } 
# variable "sqldb_import_authentication_type" {
#   type        = string
#   description = "(Required) Specifies the type of authentication used to access the server. Valid values are SQL or ADPassword."
#   default     = null
# }
# variable "sqldb_import_operation_mode" {
#   type        = string
#   description = "(Optional) Specifies the type of import operation being performed. The only allowable value is Import."
#   default     = null
# }
# variable "sqldb_source_database_id" {
#   type        = string
#   description = "(Optional) The URI of the source database if create_mode value is not Default."
#   default     = null
# }
# variable "sqldb_restore_point_in_time" {
#   type        = string
#   description = "(Optional) The point in time for the restore. Only applies if create_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z"
#   default     = null
# }
variable "sqldb_edition" {
  type        = string
  description = "(Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web."
  default     = null
}
# variable "sqldb_collation" {
#   type        = string
#   description = "(Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. Changing this forces a new resource to be created."
#   default     = "SQL_LATIN1_GENERAL_CP1_CI_AS"
# }
# variable "sqldb_max_size_bytes" {
#   type        = number
#   description = "(Optional) The maximum size that the database can grow to. Applies only if create_mode is Default."
#   default     = null
# } 
# variable "sqldb_requested_service_objective_id" {
#   type        = string
#   description = "(Optional) A GUID/UUID corresponding to a configured Service Level Objective for the Azure SQL database which can be used to configure a performance level. ."
#   default     = null
# }
variable "sqldb_requested_service_objective_name" {
  type        = string
  description = "(Optional) Use requested_service_objective_name or requested_service_objective_id to set the performance level for the database. Valid values are: S0, S1, S2, S3, P1, P2, P4, P6, P11 and ElasticPool"
  default     = null
}
# variable "sqldb_source_database_deletion_date" {
#   type        = string
#   description = "(Optional) The deletion date time of the source database. Only applies to deleted databases where create_mode is PointInTimeRestore."
#   default     = null
# }
# variable "sqldb_elastic_pool_name" {
#   type        = string
#   description = "(Optional) The name of the elastic database pool."
#   default     = null
# }

// Optional "threat_detection_policy" block
# variable "sqldb_threat_detection_policy_state" {
#   type        = string
#   description = "(Required) The State of the Policy. Possible values are Enabled, Disabled or New."
#   default     = null
# }
# variable "sqldb_threat_detection_policy_disabled_alerts" {
#   type        = list(string)
#   description = "(Optional) Specifies a list of alerts which should be disabled. Possible values include Access_Anomaly, Sql_Injection and Sql_Injection_Vulnerability."
#   default     = null
# }
# variable "sqldb_threat_detection_policy_email_account_admins" {
#   type        = list(string)
#   description = "(Optional) Should the account administrators be emailed when this alert is triggered?"
#   default     = null
# }
# variable "sqldb_threat_detection_policy_email_addresses" {
#   type        = list(string)
#   description = "(Optional) A list of email addresses which alerts should be sent to."
#   default     = null
# }
# variable "sqldb_threat_detection_policy_retention_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days to keep in the Threat Detection audit logs."
#   default     = null
# }
# variable "sqldb_threat_detection_policy_storage_account_access_key" {
#   type        = string
#   description = "(Optional) Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled."
#   default     = null
# }
# variable "sqldb_threat_detection_policy_storage_endpoint" {
#   type        = string
#   description = "(Optional) Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs. Required if state is Enabled"
#   default     = null
# }
# variable "sqldb_threat_detection_policy_use_server_default" {
#   type        = string
#   description = "(Optional) Should the default server policy be used? Defaults to Disabled."
#   default     = "Disabled"
# }


# variable "sqldb_read_scale" {
#   type        = bool
#   description = "(Optional) Read-only connections will be redirected to a high-available replica."
#   default     = null
# }
# variable "sqldb_zone_redundant" {
#   type        = bool
#   description = "(Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones."
#   default     = null
# }

// Optional "extended_auditing_policy" block
# variable "sqldb_extended_auditing_policy_storage_account_access_key" {
#   type        = string
#   description = "(Required) Specifies the access key to use for the auditing storage account."
#   default     = null
# }
# variable "vsqldb_extended_auditing_policy_storage_endpoint" {
#   type        = string
#   description = "(Required) Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net)"
#   default     = null
# }
# variable "sqldb_extended_auditing_policy_storage_account_access_key_is_secondary" {
#   type        = string
#   description = "(Optional) Specifies whether storage_account_access_key value is the storage's secondary key."
#   default     = null
# }
# variable "sqldb_extended_auditing_policy_retention_in_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days to retain logs for in the storage account."
#   default     = null
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
# variable "qlsrv_asada_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the SQL Active Directory Administrator."
#   default     = "5m"
# }
# variable "sqlsrv_asada_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the SQL Active Directory Administrator."
#   default     = "30m"
# }

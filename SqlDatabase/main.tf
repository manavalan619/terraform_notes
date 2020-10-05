# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates Sql Server
# ======================================================
module "sqlsrv" {
  source                      = "../SqlServer/"
  project_resource_group_name = data.azurerm_resource_group.project_resource_group.name
  sqlsrv_version              = var.sqlsrv_version
  sqlsrv_ad_login             = var.sqlsrv_ad_login
  sqlsrv_ad_admin_group       = var.sqlsrv_ad_admin_group
  sqlsrv_administrator_login  = var.sqlsrv_administrator_login
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  location_code               = var.location_code

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # sqlsrv_extended_auditing_policy_storage_account_access_key              = var.sqlsrv_extended_auditing_policy_storage_account_access_key
  # sqlsrv_extended_auditing_policy_storage_endpoint                        = var.sqlsrv_extended_auditing_policy_storage_endpoint
  # sqlsrv_extended_auditing_policy_storage_account_access_key_is_secondary = var.sqlsrv_extended_auditing_policy_storage_account_access_key_is_secondary
  # sqlsrv_extended_auditing_policy_retention_in_days                       = var.sqlsrv_extended_auditing_policy_retention_in_days

  # sqlsrv_timeouts_create = var.sqlsrv_timeouts_create
  # sqlsrv_timeouts_update = var.sqlsrv_timeouts_update
  # sqlsrv_timeouts_read   = var.sqlsrv_timeouts_read
  # sqlsrv_timeouts_delete = var.sqlsrv_timeouts_delete

  resource_deploy = var.resource_deploy
}

# ======================================================
# Creates Sql Firewall Rule
# ======================================================
module "sqlsrv_fw" {
  source                      = "../SqlServerFirewall/"
  project_resource_group_name = data.azurerm_resource_group.project_resource_group.name
  # sqlsrv_name                 = var.resource_deploy ? module.sqlsrv.sqlsrv_name[0] : ""
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  location_code               = var.location_code

  sqlsrv_fw_rules             = var.sqlsrv_fw_rules

  # resource_depends_on = module.sqlsrv.sqlsrv_fully_qualify_domain_name
  resource_depends_on = [module.sqlsrv]
  resource_deploy     = var.resource_deploy
}

# ======================================================
# Creates Sql Database
# ======================================================
module "sqldb" {
  source                                 = "../AddSqlDatabase/"
  project_resource_group_name            = data.azurerm_resource_group.project_resource_group.name
  # sqlsrv_name                            = var.resource_deploy ? module.sqlsrv.sqlsrv_name[0] : ""
  sqldb_edition                          = var.sqldb_edition
  sqldb_requested_service_objective_name = var.sqldb_requested_service_objective_name
  project_name                           = var.project_name
  short_project_name                     = var.short_project_name
  env_code                               = var.env_code
  location_code                          = var.location_code
  resource_index                         = var.resource_index
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # sqldb_create_mode                       = var.sqldb_create_mode

  # sqldb_import_storage_uri                  = var.sqldb_import_storage_uri
  # sqldb_import_storage_key                  = var.sqldb_import_storage_key
  # sqldb_import_storage_key_type             = var.sqldb_import_storage_key_type
  # sqldb_import_administrator_login          = var.sqldb_import_administrator_login 
  # sqldb_import_administrator_login_password = var.sqldb_import_administrator_login_password 
  # sqldb_import_authentication_type          = var.sqldb_import_authentication_type
  # sqldb_import_operation_mode               = var.sqldb_import_operation_mode

  # sqldb_source_database_id              = var.sqldb_source_database_id
  # sqldb_restore_point_in_time           = var.sqldb_restore_point_in_time

  # sqldb_collation                       = var.sqldb_collation
  # sqldb_max_size_bytes                  = var.sqldb_max_size_bytes 
  # sqldb_requested_service_objective_id  = var.sqldb_requested_service_objective_id

  # sqldb_source_database_deletion_date   = var.sqldb_source_database_deletion_date
  # sqldb_elastic_pool_name               = var.sqldb_elastic_pool_name

  # sqldb_threat_detection_policy_state                      = var.sqldb_threat_detection_policy_state
  # sqldb_threat_detection_policy_disabled_alerts            = var.sqldb_threat_detection_policy_disabled_alerts
  # sqldb_threat_detection_policy_email_account_admins       = var.sqldb_threat_detection_policy_email_account_admins
  # sqldb_threat_detection_policy_email_addresses            = var.sqldb_threat_detection_policy_email_addresses
  # sqldb_threat_detection_policy_retention_days             = var.sqldb_threat_detection_policy_retention_days
  # sqldb_threat_detection_policy_storage_account_access_key = var.sqldb_threat_detection_policy_storage_account_access_key
  # sqldb_threat_detection_policy_storage_endpoint           = var.sqldb_threat_detection_policy_storage_endpoint
  # sqldb_threat_detection_policy_use_server_default         = var.sqldb_threat_detection_policy_use_server_default

  # sqldb_read_scale     = var.sqldb_read_scale
  # sqldb_zone_redundant = var.sqldb_zone_redundant

  # // sqldb_extended_auditing_policy block
  # sqldb_extended_auditing_policy_storage_account_access_key              = var.sqldb_extended_auditing_policy_storage_account_access_key
  # sqldb_extended_auditing_policy_storage_endpoint                        = var.sqldb_extended_auditing_policy_storage_endpoint
  # sqldb_extended_auditing_policy_storage_account_access_key_is_secondary = var.sqldb_extended_auditing_policy_storage_account_access_key_is_secondary
  # sqldb_extended_auditing_policy_retention_in_days                       = var.sqldb_extended_auditing_policy_retention_in_days

  # resource_depends_on = module.sqlsrv.sqlsrv_fully_qualify_domain_name
  resource_depends_on = [module.sqlsrv, module.sqlsrv_fw]
  resource_deploy     = var.resource_deploy
}

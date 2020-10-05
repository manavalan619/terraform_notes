# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {
}
data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
# data "azurerm_sql_server" "sql_srv" {
#   name                = local.sqlsrv_target_name // var.sqlsrv_name
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

// Retrieve SUFFIX secret value for akv target name
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
locals {
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib     = "Contributor"
  reader      = "Reader"
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // sqldb Project naming convention
  resource_name = lower("sqldb-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")

  sqlsrv_target_name = lower("sqlsrv-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}

# ======================================================
# Creates Sql Database
# ======================================================
resource "azurerm_sql_database" "sqldb" {
  name                             = local.resource_name
  resource_group_name              = data.azurerm_resource_group.rg.name
  location                         = data.azurerm_resource_group.rg.location
  server_name                      = local.sqlsrv_target_name // data.azurerm_sql_server.sql_srv.name
  edition                          = var.sqldb_edition
  requested_service_objective_name = var.sqldb_requested_service_objective_name

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # create_mode                      = var.sqldb_create_mode
  # import {
  #   storage_uri                    = var.sqldb_import_storage_uri
  #   storage_key                    = var.sqldb_import_storage_key
  #   storage_key_type               = var.sqldb_import_storage_key_type
  #   administrator_login            = var.sqldb_import_administrator_login 
  #   administrator_login_password   = var.sqldb_import_administrator_login_password 
  #   authentication_type            = var.sqldb_import_authentication_type
  #   operation_mode                 = var.sqldb_import_operation_mode
  # }
  # source_database_id              = var.sqldb_source_database_id
  # restore_point_in_time           = var.sqldb_restore_point_in_time
  # # edition                         = var.sqldb_create_mode == "Default" ? var.sqldb_edition : null
  # collation                       = var.sqldb_collation
  # max_size_bytes                  = var.sqldb_max_size_bytes 
  # requested_service_objective_id  = var.sqldb_requested_service_objective_id
  # # requested_service_objective_name
  # source_database_deletion_date   = var.sqldb_source_database_deletion_date
  # elastic_pool_name               = var.sqldb_elastic_pool_name

  # threat_detection_policy {
  #   state                      = var.sqldb_threat_detection_policy_state
  #   disabled_alerts            = var.sqldb_threat_detection_policy_disabled_alerts
  #   email_account_admins       = var.sqldb_threat_detection_policy_email_account_admins
  #   email_addresses            = var.sqldb_threat_detection_policy_email_addresses
  #   retention_days             = var.sqldb_threat_detection_policy_retention_days
  #   storage_account_access_key = var.sqldb_threat_detection_policy_storage_account_access_key
  #   storage_endpoint           = var.sqldb_threat_detection_policy_storage_endpoint
  #   use_server_default         = var.sqldb_threat_detection_policy_use_server_default
  # }

  # read_scale     = var.sqldb_read_scale
  # zone_redundant = var.sqldb_zone_redundant

  # extended_auditing_policy {
  #   storage_account_access_key              = var.sqldb_extended_auditing_policy_storage_account_access_key
  #   storage_endpoint                        = var.sqldb_extended_auditing_policy_storage_endpoint
  #   storage_account_access_key_is_secondary = var.sqldb_extended_auditing_policy_storage_account_access_key_is_secondary
  #   retention_in_days                       = var.sqldb_extended_auditing_policy_retention_in_days
  # }

  tags = data.azurerm_resource_group.rg.tags

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]

}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_sql_database.sqldb : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

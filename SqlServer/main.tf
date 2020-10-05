# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
data "azuread_group" "group" {
  name = var.sqlsrv_ad_admin_group
}

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

  contrib = "Contributor"
  reader  = "Reader"

  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // SqlSrv Project naming convention
  resource_name = lower("sqlsrv-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

  sqlsrv_administrator_login = lower("sqlsrv-login-${var.short_project_name}-${var.env_code}")
}

# ======================================================
# Generates a random password
# ======================================================
resource "random_password" "sql_password" {
  length           = 16
  special          = true
  override_special = "%!#$"
}

# ======================================================
# Creates Sql Server
# ======================================================
resource "azurerm_sql_server" "sqlsrv" {
  name                         = local.resource_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = var.sqlsrv_version
  administrator_login          = local.sqlsrv_administrator_login
  administrator_login_password = random_password.sql_password.result

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # identity {
  #   type = "SystemAssigned"   // this is currently the only available value
  # }
  # extended_auditing_policy {
  #   storage_account_access_key              = var.sqlsrv_extended_auditing_policy_storage_account_access_key
  #   storage_endpoint                        = var.sqlsrv_extended_auditing_policy_storage_endpoint
  #   storage_account_access_key_is_secondary = var.sqlsrv_extended_auditing_policy_storage_account_access_key_is_secondary
  #   retention_in_days                       = var.sqlsrv_extended_auditing_policy_retention_in_days
  # }
  # timeouts {
  #   create = var.sqlsrv_timeouts_create
  #   update = var.sqlsrv_timeouts_update
  #   read   = var.sqlsrv_timeouts_read
  #   delete = var.sqlsrv_timeouts_delete
  # }

  tags = data.azurerm_resource_group.rg.tags

  count = (var.resource_deploy ? 1 : 0)
}

resource "azurerm_sql_active_directory_administrator" "asada" {
  server_name         = var.resource_deploy ? azurerm_sql_server.sqlsrv[0].name : ""
  resource_group_name = var.resource_deploy ? azurerm_sql_server.sqlsrv[0].resource_group_name : ""
  login               = var.sqlsrv_ad_login
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azuread_group.group.object_id

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timeouts {
  #   create = var.sqlsrv_asada_timeouts_create
  #   update = var.sqlsrv_asada_timeouts_update
  #   read   = var.sqlsrv_asada_timeouts_read
  #   delete = var.sqlsrv_asada_timeouts_delete
  # }

  count = (var.resource_deploy ? 1 : 0)
}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_sql_server.sqlsrv : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
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

# data "azurerm_sql_server" "sql_srv" {
#   name                = local.sqlsrv_target_name // var.sqlsrv_name
#   resource_group_name = data.azurerm_resource_group.project_resource_group.name
# }

locals {
  
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  sqlsrv_target_name = lower("sqlsrv-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}


# ======================================================
# Creates SQL Firewall Rule
# ======================================================
resource "azurerm_sql_firewall_rule" "asfw" {
  for_each            = var.resource_deploy ? var.sqlsrv_fw_rules : {}
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  server_name         = local.sqlsrv_target_name // var.sqlsrv_name
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timeouts {
  #   create = var.sqldb_fw_timeouts_create
  #   update = var.sqldb_fw_timeouts_update
  #   read   = var.sqldb_fw_timeouts_read
  #   delete = var.sqldb_fw_timeouts_delete
  # }

  depends_on = [var.resource_depends_on]
  // count      = (var.resource_deploy ? 1 : 0)
}

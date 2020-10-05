# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
// Resource naming convention
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
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // asc Project naming convention
  resource_name = lower("asc-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}

# ======================================================
# Storage Container resource
# ======================================================
resource "azurerm_storage_container" "asc" {
  name                  = local.resource_name
  storage_account_name  = var.asc_asa_name
  container_access_type = var.asc_container_access_type
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timesout {
  #   create = var.asc__timesout_create
  #   update = var.asc__timesout_update
  #   read   = var.asc__timesout_read
  #   delete = var.asc__timesout_delete
  # }
  count = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]
}

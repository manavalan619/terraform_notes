# ======================================================
# Data sources
# ======================================================

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_storage_account" "asa" {
  name                = var.asa_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_storage_container" "ascn" {
  name                 = var.ascn_name
  storage_account_name = data.azurerm_storage_account.asa.name
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

# ======================================================
# Manages internal rules and resources naming rules 
# ======================================================
locals {
  // AKV Mgt
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // AIOTHR Project naming convention
  resource_name = lower("aiothr-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")

}

# ==============================================================================
# IOTHUB ROUTE  MODULES
# ==============================================================================

resource "azurerm_iothub_route" "aiothr" {
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  iothub_name         = var.aioth_name
  name                = local.resource_name
  source              = var.aiothr_source
  condition           = var.aiothr_condition
  endpoint_names      = var.aiothr_endpoint_names
  enabled             = var.aiothr_enabled
  count               = (var.resource_deploy ? 1 : 0)
}

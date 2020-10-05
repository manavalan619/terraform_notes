# ======================================================
# Data sources
# ======================================================
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
locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // UserAssignedIdentity naming convention
  resource_name = lower("uai-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}

resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location
  name                = local.resource_name
  tags                = data.azurerm_resource_group.project_resource_group.tags
  count               = (var.resource_deploy ? 1 : 0)
}
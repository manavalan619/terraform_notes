# ======================================================
# Data sources
# ======================================================
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

  // aehcg Project naming convention
  resource_name = lower("aehcg-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}
# ======================================================
# Creates an EventHub Namespace Consumer Group
# ======================================================
resource "azurerm_eventhub_consumer_group" "aehcg" {
  name                = local.resource_name
  namespace_name      = var.aehcg_namespace_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  eventhub_name       = var.aehcg_eventhub_name
  user_metadata       = var.aehcg_user_metadata

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timeouts {
  #   create = var.aehcg_timeouts_create
  #   update = var.aehcg_timeouts_update
  #   read   = var.aehcg_timeouts_read
  #   delete = var.aehcg_timeouts_delete
  # }

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]
}


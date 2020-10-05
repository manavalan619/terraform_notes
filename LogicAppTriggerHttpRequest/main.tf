# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
data "azurerm_logic_app_workflow" "alaw" {
  name                = var.alaw_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
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

  // alathr Project naming convention
  resource_name = lower("alathr-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}

# ======================================================
# Creates Logic App Trigger Http Request
# ======================================================
resource "azurerm_logic_app_trigger_http_request" "alathr" {
  name          = local.resource_name
  logic_app_id  = data.azurerm_logic_app_workflow.alaw.id
  schema        = var.alathr_schema
  method        = var.alathr_method
  relative_path = var.alathr_relative_path
  depends_on    = [var.resource_depends_on]
  count         = (var.resource_deploy ? 1 : 0)
}

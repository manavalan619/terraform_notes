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
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib = "Contributor"
  reader  = "Reader"

  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // sta Project naming convention
  resource_name = lower("sta-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}
# ======================================================
# Creates StreamAnalytics Job without Managed Identity
# ======================================================
resource "azurerm_stream_analytics_job" "sta" {
  name                                     = local.resource_name
  location                                 = data.azurerm_resource_group.project_resource_group.location
  resource_group_name                      = data.azurerm_resource_group.project_resource_group.name
  compatibility_level                      = var.sta_compatibility_level
  data_locale                              = var.sta_data_locale
  events_late_arrival_max_delay_in_seconds = var.sta_events_late_arrival_max_delay_in_seconds
  events_out_of_order_max_delay_in_seconds = var.sta_events_out_of_order_max_delay_in_seconds
  events_out_of_order_policy               = var.sta_events_out_of_order_policy
  output_error_policy                      = var.sta_output_error_policy
  streaming_units                          = var.sta_streaming_units
  transformation_query                     = var.sta_transformation_query
  tags                                     = data.azurerm_resource_group.project_resource_group.tags
  count                                    = (var.resource_deploy ? 1 : 0)
}
# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_stream_analytics_job.sta : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

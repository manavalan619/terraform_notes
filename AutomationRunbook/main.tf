# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_automation_account" "aaa" {
  name                = var.aaa_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}
# ======================================================
# Local Data File
# ======================================================

data "local_file" "lf" {
  filename = var.aar_local_file_name != null ? var.aar_local_file_name : "${path.module}/Write-HelloWorld"
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

  contrib     = "Contributor"
  reader      = "Reader"
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // aar Project naming convention
  resource_name = lower("aar-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}
# ======================================================
# Creates Network security group
# ======================================================

resource "azurerm_automation_runbook" "aar" {
  name                    = local.resource_name
  location                = data.azurerm_resource_group.project_resource_group.location
  resource_group_name     = data.azurerm_resource_group.project_resource_group.name
  automation_account_name = data.azurerm_automation_account.aaa.name
  log_verbose             = var.aar_log_verbose
  log_progress            = var.aar_log_progress
  description             = var.aar_description
  runbook_type            = var.aar_runbook_type

  publish_content_link {
    uri = var.aar_uri
  }
  content = data.local_file.lf.content
  tags    = data.azurerm_resource_group.project_resource_group.tags

  count = (var.resource_deploy ? 1 : 0)
}
# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_automation_runbook.aar : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

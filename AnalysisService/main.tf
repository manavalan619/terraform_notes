# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
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

  // aas Project naming convention
  resource_name = lower("aas${var.env_code}${var.short_project_name}${data.azurerm_key_vault_secret.suffix_value.value}")
}
# ======================================================
# Creates Analysis Service
# ======================================================
resource "azurerm_analysis_services_server" "aas" {
  name                      = local.resource_name
  location                  = data.azurerm_resource_group.rg.location
  resource_group_name       = data.azurerm_resource_group.rg.name
  sku                       = var.aas_sku
  admin_users               = var.aas_admin_users
  enable_power_bi_service   = var.aas_enable_power_bi_service
  querypool_connection_mode = var.aas_querypool_connection_mode
  backup_blob_container_uri = var.aas_backup_blob_container_uri

  dynamic "ipv4_firewall_rule" {
    for_each = [for s in var.aas_ipv4_firewall_rules :
      {
        name        = s.name
        range_start = s.range_start
        range_end   = s.range_end
    }]
    content {
      name        = ipv4_firewall_rule.value.name
      range_start = ipv4_firewall_rule.value.range_start
      range_end   = ipv4_firewall_rule.value.range_end
    }
  }


  tags = data.azurerm_resource_group.rg.tags

  count = (var.resource_deploy ? 1 : 0)
}

locals {
  dv      = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at      = []
  hp      = []
  p       = []
  contrib = "Contributor"
  reader  = "Reader"
}
# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_analysis_services_server.aas : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

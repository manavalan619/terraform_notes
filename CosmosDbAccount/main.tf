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
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  at = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  hp = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  p  = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]

  contrib = "Contributor"
  reader  = "Reader"

  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // acdb Project naming convention
  resource_name = lower("acdb-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}
# ======================================================
# Generates a random integer
# ======================================================
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# ======================================================
# Creates CosmosDB Account (acdb)
# ======================================================
resource "azurerm_cosmosdb_account" "acdb" {
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  offer_type          = var.acdb_offer_type
  kind                = var.acdb_kind

  enable_automatic_failover = var.acdb_enable_automatic_failover

  consistency_policy {
    consistency_level       = var.acdb_consistency_level
    max_interval_in_seconds = var.acdb_max_interval_in_seconds
    max_staleness_prefix    = var.acdb_max_staleness_prefix
  }

  geo_location {
    location          = var.acdb_primary_failover_location
    failover_priority = var.acdb_primary_failover_priority
  }

  geo_location {
    prefix            = "tf-cosmos-db-${random_integer.ri.result}-customid"         // The string used to generate the document endpoints for this region.If not specified it defaults to ${cosmosdb_account.name}-${location}
    location          = data.azurerm_resource_group.project_resource_group.location //  (Required) The name of the Azure region to host replicated data
    failover_priority = var.acdb_secondary_failover_priority
  }

  capabilities {
    name = var.acdb_capabilities_name
  }
  enable_multiple_write_locations   = var.acdb_enable_multiple_write_locations
  is_virtual_network_filter_enabled = var.acdb_is_virtual_network_filter_enabled

  dynamic "virtual_network_rule" {
    for_each = [for s in var.acdb_network_rule_subnets : { id = s }]
    content {
      id = virtual_network_rule.value.id
    }
  }

  ip_range_filter                   = var.acdb_ip_range_filter

  tags        = data.azurerm_resource_group.project_resource_group.tags
  depends_on  = [var.resource_depends_on]

}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_cosmosdb_account.acdb : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.contrib, hp = local.contrib, p = local.contrib }, var.env_code)
}

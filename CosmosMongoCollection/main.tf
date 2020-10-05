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
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib     = "Contributor"
  reader      = "Reader"
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // acdb_mongo_collection Project naming convention
  resource_name             = lower("acdb_mongo_collection-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
  acdb_target_name          = lower("acdb-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  acdb_mongo_db_target_name = lower("acdb_mongo_db-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index_mongo_db}")

}

# ======================================================
# Creates CosmosDB Mongo Collection
# ======================================================
resource "azurerm_cosmosdb_mongo_collection" "acdb_mongo_collection" {
  name                = local.resource_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  account_name        = local.acdb_target_name
  database_name       = local.acdb_mongo_db_target_name //var.acdb_mongo_db_name
  default_ttl_seconds = var.acdb_mongo_collection_default_ttl_seconds
  shard_key           = var.acdb_mongo_collection_shard_key
  throughput          = var.acdb_mongo_collection_throughput

  # indexes {
  #   key    = var.acdb_mongo_collection_indexes_key
  #   unique = var.acdb_mongo_collection_indexes_unique
  # }

  depends_on = [var.resource_depends_on]
  count      = (var.resource_deploy ? 1 : 0)
}
# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_cosmosdb_mongo_collection.acdb_mongo_collection : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

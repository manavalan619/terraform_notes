# =============================================================
# Data sources
# =============================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
# =============================================================
# CosmoDB SQL container resource
# =============================================================
resource "azurerm_cosmosdb_sql_container" "acsc" {
  name                = var.acsc_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  account_name        = var.acsc_account_name
  database_name       = var.acsc_database_name
  partition_key_path  = var.acsc_partition_key_path
  unique_key {
    paths = var.acsc_unique_key_paths
  }
  throughput  = var.acsc_throughput
  default_ttl = var.acsc_default_ttl

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timesout {
  #   create = var.acdb_cosmosdb_sqldb_container__timesout_create
  #   update = var.acdb_cosmosdb_sqldb_container__timesout_update
  #   read   = var.acdb_cosmosdb_sqldb_container__timesout_read
  #   delete = var.acdb_cosmosdb_sqldb_container__timesout_delete
  # }

  depends_on = [var.resource_depends_on]
  count      = (var.resource_deploy ? 1 : 0)
}

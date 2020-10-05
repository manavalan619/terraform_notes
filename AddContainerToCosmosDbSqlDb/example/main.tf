module "acsc" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddContainerToCosmosDbSqlDb"
  project_resource_group_name = var.project_resource_group_name
  acsc_name                   = var.acsc_name
  acsc_account_name           = var.acsc_account_name
  acsc_database_name          = var.acsc_database_name
  acsc_partition_key_path     = var.acsc_partition_key_path
  acsc_unique_key_paths       = var.acsc_unique_key_paths
  acsc_throughput             = var.acsc_throughput
  acsc_default_ttl            = var.acsc_default_ttl
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
}

module "acdb_database" {
  source                         = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/CosmosDbSqlDb/"
  project_resource_group_name    = var.project_resource_group_name
  acdb_name                      = var.acdb_name
  project_name                   = var.project_name
  env_code                       = var.env_code
  short_project_name             = var.short_project_name
  location_code                  = var.location_code
  resource_index                 = var.resource_index
  acdb_cosmosdb_sqldb_throughput = var.acdb_cosmosdb_sqldb_throughput
  resource_deploy                = var.resource_deploy
  resource_depends_on            = var.resource_depends_on
}
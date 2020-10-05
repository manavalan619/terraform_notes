data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
# Create Sql Db
module "asdb" {
  source                                 = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AddSqlDatabase/"
  project_resource_group_name            = data.azurerm_resource_group.rg.name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  sqlsrv_name                            = var.sqlsrv_name
  sqldb_edition                          = var.sqldb_edition
  resource_deploy                        = var.resource_deploy
  resource_depends_on                    = var.resource_depends_on
  sqldb_requested_service_objective_name = var.sqldb_requested_service_objective_name
  resource_index                         = var.resource_index
  location_code                          = var.location_code
}

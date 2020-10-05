data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
# Create Sql server and database
module "asdb" {
  source = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlDatabase/"
  //source                                 = "../../SqlDatabase/"
  project_resource_group_name            = data.azurerm_resource_group.rg.name
  sqlsrv_ad_login                        = var.sqlsrv_ad_login
  sqlsrv_ad_admin_group                  = var.sqlsrv_ad_admin_group
  sqlsrv_administrator_login             = var.sqlsrv_administrator_login
  sqlsrv_version                         = var.sqlsrv_version
  sqlsrv_fw_rules                        = var.sqlsrv_fw_rules
  sqldb_edition                          = var.sqldb_edition
  sqldb_requested_service_objective_name = var.sqldb_requested_service_objective_name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  resource_index                         = var.resource_index
  location_code                          = var.location_code
}

data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
# Creates Sql Server
module "sql-srv" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlServer/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  sqlsrv_version              = var.sqlsrv_version
  sqlsrv_ad_login             = var.sqlsrv_ad_login
  sqlsrv_ad_admin_group       = var.sqlsrv_ad_admin_group
  sqlsrv_administrator_login  = var.sqlsrv_administrator_login
  resource_deploy             = var.resource_deploy
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  location_code               = var.location_code
}

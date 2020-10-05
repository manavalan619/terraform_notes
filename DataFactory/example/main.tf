data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

# Creates Data Factory
module "datafactory" {
  source                              = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/DataFactory/"
  env_code                            = var.env_code
  project_resource_group_name         = data.azurerm_resource_group.rg.name
  project_name                        = var.project_name
  short_project_name                  = var.short_project_name
  location_code                       = var.location_code
  resource_index                      = var.resource_index
  resource_deploy_integration_runtime = var.resource_deploy_integration_runtime
  resource_deploy                     = var.resource_deploy
  vsts_configuration                  = var.vsts_configuration
}

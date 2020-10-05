data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

module "aaa" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AutomationAccount/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  aaa_sku_name                = var.aaa_sku_name
  resource_deploy             = var.resource_deploy
}

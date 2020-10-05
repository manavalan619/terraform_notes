data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

resource "azurerm_logic_app_workflow" "alaw" {
  name                = var.alaw_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "alathr" {
  resource_deploy             = var.resource_deploy
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppTriggerHttpRequest/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  resource_index              = var.resource_index
  location_code               = var.location_code
  alaw_name                   = azurerm_logic_app_workflow.alaw.name
  alathr_schema               = var.alathr_schema
  alathr_method               = var.alathr_method
  alathr_relative_path        = var.alathr_relative_path
}

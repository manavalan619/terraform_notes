data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

resource "azurerm_logic_app_workflow" "alaw" {
  name                = var.alaw_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "alatr" {
  resource_deploy             = var.resource_deploy
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppTriggerRecurrence/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  alaw_name                   = azurerm_logic_app_workflow.alaw.name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  resource_index              = var.resource_index
  location_code               = var.location_code
  alatr_frequency             = var.alatr_frequency
  alatr_interval              = var.alatr_interval
  alatr_start_time            = var.alatr_start_time
}

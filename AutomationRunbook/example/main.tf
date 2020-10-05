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
}
module "aar" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AutomationRunbook/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
  aaa_name                    = length(module.aaa.aaa_name) > 0 ? element(module.aaa.aaa_name, 0) : ""
  aar_log_verbose             = var.aar_log_verbose
  aar_log_progress            = var.aar_log_progress
  aar_description             = var.aar_description
  aar_runbook_type            = var.aar_runbook_type
  aar_uri                     = var.aar_uri
  aar_local_file_name         = var.aar_local_file_name
  resource_deploy             = var.resource_deploy
}



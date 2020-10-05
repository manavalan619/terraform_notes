data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

# Creates logic app workflow
module "alaw" {
  source                      = "https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppWorkflow/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  resource_deploy             = var.resource_deploy
  alaw_workflow_schema        = var.alaw_workflow_schema
  alaw_workflow_version       = var.alaw_workflow_version
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
}

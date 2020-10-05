data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
resource "azurerm_app_service_plan" "plan" {
  name                = var.aasp_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku {
    tier = var.plan_sku_tier
    size = var.plan_sku_size
  }
}

module "aas" {
  source                                   = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AppService/"
  project_resource_group_name              = data.azurerm_resource_group.rg.name
  aasp_name                                = azurerm_app_service_plan.plan.name
  aas_site_config_dotnet_framework_version = var.aas_site_config_dotnet_framework_version
  aas_site_config_scm_type                 = var.aas_site_config_scm_type
  aas_connection_string_name               = var.aas_connection_string_name
  aas_connection_string_type               = var.aas_connection_string_type
  aas_connection_string_value              = var.aas_connection_string_value
  resource_deploy                          = var.resource_deploy
  project_name                             = var.project_name
  short_project_name                       = var.short_project_name
  env_code                                 = var.env_code
  resource_index                           = var.resource_index
  location_code                            = var.location_code
}

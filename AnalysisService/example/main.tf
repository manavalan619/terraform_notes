data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

module "aas" {
  resource_deploy               = var.resource_deploy
  source                        = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AnalysisService"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  aas_sku                       = var.aas_sku
  aas_admin_users               = var.aas_admin_users
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  aas_enable_power_bi_service   = var.aas_enable_power_bi_service
  aas_querypool_connection_mode = var.aas_querypool_connection_mode
  aas_backup_blob_container_uri = var.aas_backup_blob_container_uri
  aas_ipv4_firewall_rules       = var.aas_ipv4_firewall_rules
}

#Data source
data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

# Create Event Hubs Namespace
module "aehn" {
  source                        = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/EventHubsNamespace/"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  env_code                      = var.env_code
  project_name                  = var.project_name
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  resource_index                = var.resource_index
  aehn_sku                      = var.aehn_sku
  aehn_capacity                 = var.aehn_capacity
  aehn_auto_inflate_enabled     = var.aehn_auto_inflate_enabled
  aehn_maximum_throughput_units = var.aehn_maximum_throughput_units
  resource_deploy               = var.resource_deploy
}

# Create Event Hub
module "aeh" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHub"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  aehn_name                   = length(module.aehn.aehn_name) > 0 ? element(module.aehn.aehn_name, 0) : ""
  aeh_name                    = var.aeh_name
  aeh_partition_count         = var.aeh_partition_count
  aeh_message_retention       = var.aeh_message_retention
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
}

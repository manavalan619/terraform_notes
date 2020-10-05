# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}



# ======================================================
# Creates app service encironment
# ======================================================


resource "azurerm_app_service_environment" "aase" {
  name                   = var.aase_name
  subnet_id              = var.aase_subnet_id
  pricing_tier           = var.aase_pricing_tier
  front_end_scale_factor = var.aase_front_end_scale_factor


  tags  = data.azurerm_resource_group.project_resource_group.tags
  
  count = (var.resource_deploy ? 1 : 0)
}


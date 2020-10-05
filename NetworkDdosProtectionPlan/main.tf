# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates Network ddos protection plan
# ======================================================

resource "azurerm_network_ddos_protection_plan" "andpl" {
  name                = var.andpl_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  tags                = data.azurerm_resource_group.project_resource_group.tags
  count               = (var.resource_deploy ? 1 : 0)
}


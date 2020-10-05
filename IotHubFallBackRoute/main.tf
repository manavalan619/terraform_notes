# ======================================================
# Data sources
# ======================================================

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_storage_account" "asa" {
  name                = var.asa_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_storage_container" "ascn" {
  name                 = var.ascn_name
  storage_account_name = data.azurerm_storage_account.asa.name
}

# ==============================================================================
# IOTHUB FALL BACKROUTE  MODULES
# ==============================================================================

resource "azurerm_iothub_fallback_route" "aiothfbr" {
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  iothub_name         = var.aioth_name
  condition           = var.aiothfbr_condition
  endpoint_names      = var.aiothfbr_endpoint_names
  enabled             = var.aiothfbr_enabled
  count               = (var.resource_deploy ? 1 : 0)
}

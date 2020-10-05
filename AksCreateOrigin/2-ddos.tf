# ==================================================================================================
# Creates a ddos protection plan
# ==================================================================================================
resource "azurerm_network_ddos_protection_plan" "aks_vnet_ddos_protect" {
  count = 0
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled && var.aks_vnet_ddos_enabled == true && var.aks_vnet_ddos_id == null ? 1 : 0
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled && var.aks_vnet_ddos_enabled == true ? 1 : 0
  # count               = var.deploy_aks == true && var.aks_vnet_ddos_id == null ? 1 : 0
  name                = local.aks_vnet_ddos_target_name // "aks-ddos-${local.vnet_target_name}"
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  tags = data.azurerm_resource_group.project_resource_group.tags

}
# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
# data "azurerm_virtual_network" "avnet1" {
#   name                = var.avnet1_name
#   resource_group_name = data.azurerm_resource_group.project_resource_group.name
# }
# data "azurerm_virtual_network" "avnet2" {
#   name                = var.avnet2_name
#   resource_group_name = data.azurerm_resource_group.project_resource_group.name
# }

# ==============================================================================
# Virtual Network Peering Resource
# ==============================================================================

resource "azurerm_virtual_network_peering" "avnp" {
  count                        = (var.resource_deploy ? 1 : 0)
  name                         = var.avnp_name
  resource_group_name          = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name         = var.avnet1_name
  remote_virtual_network_id    = var.avnet2_remote_virtual_network_id
  allow_virtual_network_access = var.avnp_allow_virtual_network_access
  allow_forwarded_traffic      = var.avnp_allow_forwarded_traffic
  allow_gateway_transit        = var.avnp_allow_gateway_transit
  use_remote_gateways          = var.avnp_use_remote_gateways
  
  depends_on = [var.resource_depends_on]
}

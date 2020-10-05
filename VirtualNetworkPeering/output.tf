# ==============================================================================
# Virtual Network Peering - Output Variables
# ==============================================================================
output "avnp_id" {
  value       = [for instance in azurerm_virtual_network_peering.avnp : instance.id]
  description = "The ID of the Virtual Network Peering."
}

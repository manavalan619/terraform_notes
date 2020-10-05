# ==============================================================================
# App service environment - Output variables
# ==============================================================================
output "avnet_id" {
  value       = module.virtual-network.avnet_id
  description = "The ID of the virtual network."
}

output "avnet_name" {
  value       = module.virtual-network.avnet_name
  description = "The name of the virtual network."
}

output "avnet_resource_group_name" {
  value       = module.virtual-network.avnet_resource_group_name
  description = "The name of the resource group in which the virtual network is created in."
}

output "avnet_virtual_network_location" {
  value       = module.virtual-network.avnet_virtual_network_location
  description = "the location where the virtual network is created."
}

output "avnet_virtual_network_adress_space" {
  value       = module.virtual-network.avnet_virtual_network_adress_space
  description = "Theadresse space that is used the virtual network."
}

output "avnet_virtual_network_sbnet_blocks" {
  value       = module.virtual-network.avnet_virtual_network_sbnet_blocks
  description = "One or more subnet blocks"
}   

# ==============================================================================
# App service environment - Output variables
# ==============================================================================
output "avnet_id" {
    value       = [for instance in azurerm_virtual_network.avnet : instance.id]
    description = "The ID of the virtual network."
}
output "avnet_name" {
    value       = [for instance in azurerm_virtual_network.avnet : instance.name]
    description = "The name of the virtual network."
}
output "avnet_resource_group_name" {
    value       = [for instance in azurerm_virtual_network.avnet : instance.resource_group_name]
    description = "The name of the resource group in which the virtual network is created in."
}
output "avnet_virtual_network_location" {
    value       = [for instance in azurerm_virtual_network.avnet : instance.location]
    description = "the location where the virtual network is created."
}
output "avnet_virtual_network_adress_space" {
    value       = [for instance in azurerm_virtual_network.avnet : instance.address_space]
    description = "Theadresse space that is used the virtual network."
}

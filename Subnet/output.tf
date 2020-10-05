# ==============================================================================
# Subnet - Output variables
# ==============================================================================
output "subnet_id" {
    value       = [for instance in azurerm_subnet.subnet : instance.id]
    description = "The ID of the subnet."
}
output "subnet_name" {
    value       = [for instance in azurerm_subnet.subnet : instance.name]
    description = "The name of the subnet."
}
output "subnet_resource_group_name" {
    value       = [for instance in azurerm_subnet.subnet : instance.resource_group_name]
    description = "The name of the resource group in which the subnet is created in."
}
output "subnet_virtual_network_name" {
    value       = [for instance in azurerm_subnet.subnet : instance.virtual_network_name]
    description = "The name of the virtual network in which the subnet is created in."
}



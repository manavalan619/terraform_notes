# ==============================================================================
# App service environment - Output variables
# ==============================================================================
output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "The ID of the subnet."
}

output "subnet_name" {
  value       = module.subnet.subnet_name
  description = "The name of the subnet."
}

output "subnet_resource_group_name" {
  value       = module.subnet.subnet_resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "subnet_virtual_network_name" {
  value       = module.subnet.subnet_virtual_network_name
  description = "The name of the virtual network in which the subnet is created in."
}
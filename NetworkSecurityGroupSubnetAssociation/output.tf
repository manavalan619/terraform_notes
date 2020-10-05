# ==============================================================================
# Network Security Group Subnet Association - Output variables
# ==============================================================================
output "ansg_id" {
    value       = [for instance in azurerm_subnet_network_security_group_association.ansg_subnet : instance.id]
    description = "The ID of the Network Security Group subnet association"
}
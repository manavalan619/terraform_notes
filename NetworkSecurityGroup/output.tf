# ==============================================================================
# Network Security Group - Output variables
# ==============================================================================
output "ansg_id" {
    value       = [for instance in azurerm_network_security_group.ansg : instance.id]
    description = "The ID of the Network Security Group."
}
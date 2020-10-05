# ==============================================================================
# Network ddos protection plan - Output variables
# ==============================================================================
output "andpl_id" {
  value       = [for instance in azurerm_network_ddos_protection_plan.andpl : instance.id]
  description = "The ID of the DDoS Protection Plan"
}


output "andpl_virtual_network_ids" {
  value       = [for instance in azurerm_network_ddos_protection_plan.andpl : instance.virtual_network_ids]
  description = "A list of Virtual Network ID's associated with the DDoS Protection Plan."
}

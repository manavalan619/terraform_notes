# ==============================================================================
# Network ddos protection plan - Output variables
# ==============================================================================
output "andpl_id" {
  value       = module.andpl.andpl_id
  description = "The ID of the DDoS Protection Plan"
}

output "andpl_virtual_network_ids" {
  value       = module.andpl.andpl_virtual_network_ids
  description = "A list of Virtual Network ID's associated with the DDoS Protection Plan."
}
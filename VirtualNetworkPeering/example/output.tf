# ==============================================================================
# Virtual Network Peering - Output Variables
# ==============================================================================
output "avnp_id" {
  value       = module.avnp.avnp_id
  description = "The ID of the Virtual Network Peering."
}

# ==============================================================================
# Network Security Group - Output variables
# ==============================================================================
output "ansg_id" {
  value       = module.ansg.ansg_id
  description = "The ID of the Network Security Group."
}
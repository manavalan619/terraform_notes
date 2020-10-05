# ==============================================================================
# Event Hub Consumer Group - Output variables
# ==============================================================================
output "aehcg_id" {
  value       = module.aehcg.aehcg_id
  description = "Event Hub Consumer Group ID."
}
output "aehcg_name" {
  value       = module.aehcg.aehcg_name
  description = "Event Hub Consumer Group Name."
}

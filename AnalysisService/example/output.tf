# ==============================================================================
# Analysis Services - Output variables
# ==============================================================================
output "aas_id" {
  value       = module.aas.aas_id
  description = "Analysis Service ID."
}
output "aas_server_full_name" {
  value       = module.aas.aas_server_full_name
  description = "Analysis Service Server Full Name."
}

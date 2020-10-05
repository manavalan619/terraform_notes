# ==============================================================================
# Analysis Services - Output variables
# ==============================================================================
output "aas_id" {
    value       = [for instance in azurerm_analysis_services_server.aas : instance.id]
    description = "Analysis Service ID."
}
output "aas_server_full_name" {
    value       = [for instance in azurerm_analysis_services_server.aas : instance.server_full_name]
    description = "Analysis Service Server Full Name."
}
# ==============================================================================
# App Services - Output variables
# ==============================================================================
output "app_service_id" {
    value       = [for instance in azurerm_app_service.aas : instance.id]
    description = "Analysis App ID."
}
output "aas_default_site_hostname" {
    value       = [for instance in azurerm_app_service.aas: instance.default_site_hostname]
    description = "The Default Hostname associated with the App Service."
}
output "aas_outbound_ip_addresses" {
    value       = [for instance in azurerm_app_service.aas: instance.outbound_ip_addresses]
    description = "A comma separated list of outbound IP addresses."
}
output "aas_possible_outbound_ip_addresses" {
    value       = [for instance in azurerm_app_service.aas: instance.possible_outbound_ip_addresses]
    description = "A comma separated list of outbound IP addresses."
}



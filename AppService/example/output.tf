# ==============================================================================
# App Services - Output variables
# ==============================================================================
output "app_service_id" {
  value       = module.aas.app_service_id
  description = "Analysis App ID."
}
output "aas_default_site_hostname" {
  value       = module.aas.aas_default_site_hostname
  description = "The Default Hostname associated with the App Service."
}
output "aas_outbound_ip_addresses" {
  value       = module.aas.aas_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses."
}
output "aas_possible_outbound_ip_addresses" {
  value       = module.aas.aas_possible_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses."
}

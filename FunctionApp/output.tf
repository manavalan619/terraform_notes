# ==============================================================================
# Function App - Output variables
# ==============================================================================
output "afa_id" {
    value       = [for instance in azurerm_function_app.afa : instance.id]
    description = "Function App ID."
}
output "afa_site_credential" {
  value       = [for instance in azurerm_function_app.afa : instance.site_credential]
  description = "A site_credential block, which contains the site-level credentials used to publish to this App Service."
}
output "afa_identity_id" {
  value       = [for instance in azurerm_function_app.afa : instance.identity]
  description = "An identity block, which contains the Managed Service Identity information for this App Service."
}

// additionnal usefull outputs
output "afa_default_hostname" {
  value       = [for instance in azurerm_function_app.afa : instance.default_hostname]
  description = "The default hostname associated with the Function App - such as mysite.azurewebsites.net"
}
output "afa_outbound_ip_addresses" {
  value       = [for instance in azurerm_function_app.afa : instance.outbound_ip_addresses]
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12"
}
output "afa_possible_outbound_ip_addresses" {
  value       = [for instance in azurerm_function_app.afa : instance.possible_outbound_ip_addresses]
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
}
output "afa_kind" {
  value       = [for instance in azurerm_function_app.afa : instance.kind]
  description = "The Function App kind - such as functionapp,linux,container"
}
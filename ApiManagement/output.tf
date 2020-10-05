# ======================================================
# APIM output variables
# ======================================================
output "apim_gateway_regional_url" {
  value       = [for instance in azurerm_api_management.apim : instance.gateway_regional_url]
  description = "The Region URL for the Gateway of the API Management Service."
}
output "apim_id" {
  value       = [for instance in azurerm_api_management.apim : instance.id]
  description = "The ID of the API Management Service."
}
output "apim_management_api_url" {
  value       = [for instance in azurerm_api_management.apim : instance.management_api_url]
  description = "The URL for the Management API associated with this API Management service."
}
output "apim_portal_url" {
  value       = [for instance in azurerm_api_management.apim : instance.portal_url]
  description = "The URL for the Publisher Portal associated with this API Management service."
}
output "apim_public_ip_addresses" {
  value       = [for instance in azurerm_api_management.apim : instance.public_ip_addresses]
  description = "The Public IP addresses of the API Management Service."
}
output "apim_scm_url" {
  value       = [for instance in azurerm_api_management.apim : instance.public_ip_addresses]
  description = "The URL for the SCM (Source Code Management) Endpoint associated with this API Management service."
}
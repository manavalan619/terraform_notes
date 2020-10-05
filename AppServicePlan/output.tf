# ==============================================================================
# App Service Plan - Output variables
# ==============================================================================
output "aasp_id" {
  value       = [for instance in azurerm_app_service_plan.aasp : instance.id]
  description = "The App Service Plan ID."
}
output "aasp_maximum_number_of_workers" {
  value       = [for instance in azurerm_app_service_plan.aasp : instance.maximum_number_of_workers]
  description = "The maximum number of workers supported with the App Service Plan's sku."
}

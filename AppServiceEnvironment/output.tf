# ==============================================================================
# App service environment - Output variables
# ==============================================================================
output "aase_id" {
    value       = [for instance in azurerm_app_service_environment.aase : instance.id]
    description = "app service environment ID."
}

output "aase_resource_group_name" {
    value       = [for instance in azurerm_app_service_environment.aase : instance.resource_group_name]
    description = "The name of the Resource Group where the App Service Environment exists."
}

output "aase_location" {
    value       = [for instance in azurerm_app_service_environment.aase : instance.location]
    description = "The location where the App Service Environment exists."
}

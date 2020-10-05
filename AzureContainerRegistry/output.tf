# ==============================================================================
# Azure Container Registry - Output variables
# ==============================================================================
output "acr_id" {
    value       = [for instance in azurerm_container_registry.acr : instance.id]
    description = "The ID of the Container Registry."
}
output "acr_login_server" {
    value       = [for instance in azurerm_container_registry.acr : instance.login_server]
    description = "The URL that can be used to log into the container registry."
}
output "acr_admin_username" {
    value       = [for instance in azurerm_container_registry.acr : instance.admin_username]
    description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
}
output "acr_admin_password" {
    value       = [for instance in azurerm_container_registry.acr : instance.admin_password]
    description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
    sensitive   = true
}
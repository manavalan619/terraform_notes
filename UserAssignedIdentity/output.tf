# ==============================================================================
# User Assigned Identity - Output variables
# ==============================================================================
output "uai_id" {
    value       = [for instance in azurerm_user_assigned_identity.uai : instance.id]
    description = "The user assigned identity ID."
}
output "uai_principal_id" {
    value       = [for instance in azurerm_user_assigned_identity.uai : instance.principal_id]
    description = "Service Principal ID associated with the user assigned identity."
}
output "uai_client_id" {
    value       = [for instance in azurerm_user_assigned_identity.uai : instance.client_id]
    description = "Client ID associated with the user assigned identity."
}
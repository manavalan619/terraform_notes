# ==============================================================================
# Data Factory - Output variables
# ==============================================================================
output "adf_id" {
    value       = [for instance in azurerm_data_factory.adf: instance.id]
    description = "Datafactory ID."
}
output "adf_name" {
    value       = [for instance in azurerm_data_factory.adf: instance.name]
    description = "Datafactory Name."
}
output "adf_identity_id" {
    value       = [for instance in azurerm_data_factory.adf: instance.identity[0].principal_id]
    description = "Datafactory Identity ID."
}


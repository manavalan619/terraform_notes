# ==============================================================================
# Azure Storage Container Output variables
# ==============================================================================
output "asc_id" {
  value       = [for instance in azurerm_storage_container.asc : instance.id]
  description = "The ID of the Storage Container."
}
output "asc_name" {
  value       = [for instance in azurerm_storage_container.asc : instance.name]
  description = "Storage Account Name"
}
output "asc_has_immutability_policy" {
  value       = [for instance in azurerm_storage_container.asc : instance.has_immutability_policy]
  description = "Is there an Immutability Policy configured on this Storage Container?"
}
output "asc_has_legal_hold" {
  value       = [for instance in azurerm_storage_container.asc : instance.has_legal_hold]
  description = "Is there a Legal Hold configured on this Storage Container?"
}
output "asc_resource_manager_id" {
  value       = [for instance in azurerm_storage_container.asc : instance.resource_manager_id]
  description = "The Resource Manager ID of this Storage Container."
}


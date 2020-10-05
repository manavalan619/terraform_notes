# ==============================================================================
# Azure Storage Container Output variables
# ==============================================================================
output "asc_id" {
  value       = module.asc.asc_id
  description = "The ID of the Storage Container."
}
output "asc_name" {
  value       = module.asc.asc_name
  description = "Storage Account Name"
}
output "asc_has_immutability_policy" {
  value       = module.asc.asc_has_immutability_policy
  description = "Is there an Immutability Policy configured on this Storage Container?"
}
output "asc_has_legal_hold" {
  value       = module.asc.asc_has_legal_hold
  description = "Is there a Legal Hold configured on this Storage Container?"
}
output "asc_resource_manager_id" {
  value       = module.asc.asc_resource_manager_id
  description = "The Resource Manager ID of this Storage Container."
}

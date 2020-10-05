# ==============================================================================
# Data Factory - Output variables
# ==============================================================================
output "adf_id" {
  value       = module.datafactory.adf_id
  description = "Datafactory ID."
}
output "adf_name" {
  value       = module.datafactory.adf_name
  description = "Datafactory Name."
}
output "adf_identity_id" {
  value       = module.datafactory.adf_identity_id
  description = "Datafactory Identity ID."
}
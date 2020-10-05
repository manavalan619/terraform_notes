# ==============================================================================
# Azure Machine Learning Workspace - Output variables
# ==============================================================================
output "aml_id" {
  value       = module.aml.aml_id
  description = "The ID of the Machine Learning Workspace."
}
output "aml_name" {
  value       = module.aml.aml_name
  description = "The name of the Machine Learning Workspace"
}
output "aml_identity_id" {
  value       = module.aml.aml_identity_id
  description = "The (Client) ID of the Service Principal."
}
output "aml_tenant_id" {
  value       = module.aml.aml_tenant_id
  description = "The ID of the Tenant the Service Principal is assigned in."
}

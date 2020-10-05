# ==============================================================================
# Azure Machine Learning Workspace - Output variables
# ==============================================================================
output "aml_id" {
  value       = [for instance in azurerm_machine_learning_workspace.aml : instance.id]
  description = "The ID of the Machine Learning Workspace."
}
output "aml_name" {
  value       = [for instance in azurerm_machine_learning_workspace.aml : instance.name]
  description = "The name of the Machine Learning Workspace"
}
output "aml_identity_id" {
  value       = [for instance in azurerm_machine_learning_workspace.aml : instance.identity[0].principal_id]
  description = "The (Client) ID of the Service Principal."
}
output "aml_tenant_id" {
  value       = [for instance in azurerm_machine_learning_workspace.aml : instance.identity[0].tenant_id]
  description = "The ID of the Tenant the Service Principal is assigned in."
}

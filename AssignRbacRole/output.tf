# ==============================================================================
# Assign RBAC Role - Output variables
# ==============================================================================
# output "role_id" {
#     value       = [for instance in azurerm_analysis_services_server.role : instance.id]
#     description = "The Role Assignment ID."
# }
# output "role_principal_type" {
#     value       = [for instance in azurerm_analysis_services_server.role : instance.principal_type]
#     description = "The type of the principal_id, e.g. User, Group, Service Principal, Application, etc."
# }

# ==============================================================================
# Service Princpal - Output variables
# ==============================================================================
output "sp_application_id" {
  description = "The ID of the Azure AD Application"
  value       = azuread_service_principal.sp[0].application_id
}
output "sp_id" {
  description = "The Service Principal's Object ID."
  value       = azuread_service_principal.sp[0].id
}
output "sp_object_id" {
  description = "The ID of the Azure AD Service Principal"
  value       = azuread_service_principal.sp[0].object_id
}
output "sp_display_name" {
  description = "The Display Name of the Azure AD Application associated with this Service Principal"
  value       = azuread_service_principal.sp[0].display_name
}
output "sp_app_role_assignment_required" {
  description = "Whether this Service Principal requires an AppRoleAssignment to a user or group before Azure AD will issue a user or access token to the application."
  value       = azuread_service_principal.sp[0].app_role_assignment_required
} 
output "sp_oauth2_permissions" {
  description = " A collection of OAuth 2.0 permissions exposed by the associated application. Each permission is covered by a oauth2_permission block."
  value       = azuread_service_principal.sp[0].oauth2_permissions
} 
output "sp_password" {
  description = "The password of the generated service principal. This is only exported when create_for_rbac is true."
  value       = local.sp_password
  sensitive   = true
}
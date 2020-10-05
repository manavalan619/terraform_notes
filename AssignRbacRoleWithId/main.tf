# ======================================================
# Role Assigment
# ======================================================
resource "azurerm_role_assignment" "role" {
  count                = (var.resource_deploy ? 1 : 0)
  scope                = var.role_scope_id
  role_definition_name = var.role_definition_name 
  principal_id         = var.role_principal_id
 
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # role_definition_id   = var.role_definition_id   // Conflicts with role_definition_name
  # skip_service_principal_aad_check = var.role_skip_service_principal_aad_check

  # timeouts {
  #   create = var.role_timeouts_create
  #   update = var.role_timeouts_update
  #   read   = var.role_timeouts_read
  #   delete = var.role_timeouts_delete
  # }

  depends_on = [var.resource_depends_on]

}
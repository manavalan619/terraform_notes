# ======================================================
# Data sources
# ======================================================
data "azuread_group" "group" {
  count = length(var.aad_group_list)
  name = var.aad_group_list[count.index]
}

# ======================================================
# Role Assigment
# ======================================================
resource "azurerm_role_assignment" "role" {
  count                = length(var.role_scope_ids) == 0 ? 0 : length([for instance in data.azuread_group.group: instance.object_id])
  scope                = length(var.role_scope_ids) == 0 ? "" : var.role_scope_ids[0]
  role_definition_name = var.role_definition_name // Conflicts with role_definition_id.
  principal_id         = [for instance in data.azuread_group.group: instance.object_id][count.index]
 
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # role_definition_id   = var.role_definition_id   // Conflicts with role_definition_name
  # skip_service_principal_aad_check = var.role_skip_service_principal_aad_check

  # timeouts {
  #   create = var.role_timeouts_create
  #   update = var.role_timeouts_update
  #   read   = var.role_timeouts_read
  #   delete = var.role_timeouts_delete
  # }
  # depends_on          = [var.resource_depends_on]
}
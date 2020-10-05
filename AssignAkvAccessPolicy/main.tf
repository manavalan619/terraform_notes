# ======================================================
# Data sources
# ======================================================
data "azuread_group" "group" {
  count = length(var.aad_group_list)
  name  = var.aad_group_list[count.index]
}

# ======================================================
# Role Assigment
# ======================================================
module "project-group-access-policy" {
  source                           = "../KeyVaultAccessPolicy/"
  akv_access_policy_key_vault_id   = length(var.role_scope_ids) == 0 ? "" : var.role_scope_ids[0]
  akv_access_policy_object_ids     = length(var.role_scope_ids) == 0 ? [] : [for instance in data.azuread_group.group : instance.object_id]
  akv_access_policy_security_level = var.role_definition_name
  resource_depends_on              = var.resource_depends_on
}
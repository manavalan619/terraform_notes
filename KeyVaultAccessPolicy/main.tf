# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

# ======================================================
# Creates Key Vault Access Policy
# ======================================================
resource "azurerm_key_vault_access_policy" "akv_access_policy" {
  # count = (var.resource_deploy ? length(var.akv_access_policy_object_ids) : 0)
  count = length(var.akv_access_policy_object_ids)
  # provider           = var.provider
  key_vault_id            = var.akv_access_policy_key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.akv_access_policy_object_ids[count.index]
  key_permissions         = lookup(var.akv_access_policy_key_permissions, var.akv_access_policy_security_level)
  secret_permissions      = lookup(var.akv_access_policy_secret_permissions, var.akv_access_policy_security_level)
  certificate_permissions = lookup(var.akv_access_policy_certificate_permission, var.akv_access_policy_security_level)

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # application_id      = var.akv_access_policy_application_id
  # storage_permissions = var.akv_access_policy_storage_permissions

  depends_on              = [var.resource_depends_on]
}

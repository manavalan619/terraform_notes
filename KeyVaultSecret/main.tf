// Refer to RG to retreive RG tags
# data "azurerm_resource_group" "project_resource_group" {
#   name = var.project_resource_group_name
# }

# ======================================================
# Creates Key Vault Secret
# ======================================================
resource "azurerm_key_vault_secret" "akv_secret" {
  count        = length(var.akv_key_vault_id)
  name         = var.akv_secret_name
  value        = var.akv_secret_value
  key_vault_id = var.akv_key_vault_id[count.index]
  content_type = var.akv_secret_content_type


  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # not_before_date = var.akv_secret_not_before_date
  # expiration_date = var.akv_secret_expiration_date
  # tags            = data.azurerm_resource_group.project_resource_group.tags

  
  depends_on = [var.resource_depends_on]
  
}

# ======================================================
# Data sources and Locals
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

// Retrieve SUFFIX secret value for akv target name
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // Private DNS Zone naming convention
  // resource_index variable is used to set the domain name suffix for the target project : eg drillx.com
  // resource_name                         = lower("pdz-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
  resource_name                         = lower("private.${var.private_dns_zone_name}")
  private_dns_zone_vnetlink_target_name = lower("pdz-vnetlink-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")



}

# ==================================================================================
# Creates a Private DNS Zone
# ==================================================================================
resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name // var.private_dns_zone_name 
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  tags                = data.azurerm_resource_group.project_resource_group.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_vnetlink" {
  count                 = (var.resource_deploy ? 1 : 0)
  name                  = local.private_dns_zone_vnetlink_target_name
  resource_group_name   = data.azurerm_resource_group.project_resource_group.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone[0].name   
  virtual_network_id    = var.pdz_virtual_network_id
  registration_enabled  = true // Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? Defaults to false.
  tags                  = data.azurerm_resource_group.project_resource_group.tags
  depends_on            = [var.resource_depends_on]
}
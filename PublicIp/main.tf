# ======================================================
# Data sources
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

  // Public IP naming convention
  resource_name = lower("public-ip-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}

# ==================================================================================
# Creates an Azure Public IP
# ==================================================================================
resource "azurerm_public_ip" "apip" {
    count                   = (var.resource_deploy ? 1 : 0)
    name                    = local.resource_name 
    resource_group_name     = data.azurerm_resource_group.project_resource_group.name
    location                = data.azurerm_resource_group.project_resource_group.location
    sku                     = var.apip_sku                      // ("Standard" as a default value)
    allocation_method       = var.apip_allocation_method        // ("Static" as a default value)
    ip_version              = var.apip_ip_version               // (IPv4 as a default value)
    domain_name_label       = var.apip_domain_name_label
    reverse_fqdn            = var.apip_reverse_fqdn
    # public_ip_prefix_id     = var.apip_public_ip_prefix_id
    zones                   = var.apip_zones
    idle_timeout_in_minutes = var.apip_idle_timeout_in_minutes  // (30 as a default value)

    tags                    = data.azurerm_resource_group.project_resource_group.tags

}
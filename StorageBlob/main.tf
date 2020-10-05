# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {

}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_storage_account" "asa" {
  name                = var.asa_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_storage_container" "asc" {
  name                 = var.asc_name
  storage_account_name = data.azurerm_storage_account.asa.name
}
// Resource naming convention
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

  // asb Project naming convention
  resource_name = lower("asb-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}


# ======================================================
# Storage Blob resource
# ======================================================
resource "azurerm_storage_blob" "asb" {
  name                   = local.resource_name
  storage_account_name   = data.azurerm_storage_account.asa.name
  storage_container_name = data.azurerm_storage_container.asc.name
  type                   = var.asb_type
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # size                   = var.asb_size
  # access_tier            = var.asb_access_tier
  # content_type           = var.asb_content_type
  # source                 = var.asb_source
  # source_content         = var.asb_source_content
  # source_uri             = var.asb_source_uri
  # parallelism            = var.asb_parallelism
  # metadata               = var.asb_metadata
  # timesout {
  #   create = var.asb__timesout_create
  #   update = var.asb__timesout_update
  #   read   = var.asb__timesout_read
  #   delete = var.asb__timesout_delete
  # }
  count = (var.resource_deploy ? 1 : 0)
}

# ======================================================
# Data sources
# ======================================================

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_storage_account" "asa" {
  name                = var.asa_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_storage_container" "ascn" {
  name                 = var.ascn_name
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


# ======================================================
# Manages internal rules and resources naming rules 
# ======================================================
locals {
  // AKV Mgt
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // AIOTHEPSC Project naming convention
  resource_name = lower("aiothepsc-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}


### Create a EventGrid Topic

# ======================================================
# Local variables
# ======================================================

locals {
  l_tags = {
    Environment     = var.assie_rgTags["Environment"]
    ApplicationName = var.assie_rgTags["ApplicationName"]
    ApplicationCode = var.assie_rgTags["ApplicationCode"]
    Branch          = var.assie_rgTags["Branch"]
    Exploitation    = var.assie_rgTags["Exploitation"]
    SecurityLevel   = var.assie_rgTags["SecurityLevel"]
  }
  l_rg_name     = var.assie_rgName
  l_rg_location = var.assie_rgLocation

  ### calculate eventGrid topic name
  l_cloud_code     = "az"
  l_resource_code  = "iothesc"
  l_resource_index = var.module_iothescIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)
}
# ======================================================
# Iot Hub Endpoint
# ======================================================

resource "azurerm_iothub_endpoint_storage_container" "iothesc" {
  resource_group_name        = local.l_rg_name
  iothub_name                = var.aioth_name
  name                       = local.l_resource_name
  connection_string          = data.azurerm_storage_account.asa.primary_blob_connection_string
  batch_frequency_in_seconds = var.aiothepsc_batch_frequency_in_seconds
  max_chunk_size_in_bytes    = var.aiothepsc_max_chunk_size_in_bytes
  container_name             = data.azurerm_storage_container.ascn.name
  encoding                   = var.aiothepsc_encoding
  file_name_format           = var.aiothepsc_file_name_format
  count                      = (var.resource_deploy ? 1 : 0)
}

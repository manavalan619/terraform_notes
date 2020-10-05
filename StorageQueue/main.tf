
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

  // ASQ Project naming convention
  resource_name = lower("asq-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")

}

# ======================================================
# creates storage queue
# ======================================================

resource "azurerm_storage_queue" "asq" {
  name                 = local.resource_name
  storage_account_name = data.azurerm_storage_account.asa.name
  count                = (var.resource_deploy ? 1 : 0)
}

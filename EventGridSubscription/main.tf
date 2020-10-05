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

  // AEGES Project naming convention
  resource_name = lower("aeges-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

}

# ======================================================
# Creates EventGrid Event Subscription
# ======================================================

resource "azurerm_eventgrid_event_subscription" "aeges" {
  name  = local.resource_name
  scope = data.azurerm_resource_group.project_resource_group.id

  storage_queue_endpoint {
    storage_account_id = data.azurerm_storage_account.asa.id
    queue_name         = var.asq_name
  }

  event_delivery_schema = var.aeges_event_delivery_schema
  count                 = (var.resource_deploy ? 1 : 0)

  subject_filter {
    subject_begins_with = var.aeges_subject_begins_with
    subject_ends_with   = var.aeges_subject_ends_with
  }

  retry_policy {
    max_delivery_attempts = var.aeges_max_delivery_attempts
    event_time_to_live    = var.aeges_event_time_to_live
  }
}

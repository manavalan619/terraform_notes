# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
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
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib     = "Contributor"
  reader      = "Reader"
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // asa Project naming convention
  resource_name = lower("asa${var.env_code}${var.short_project_name}${data.azurerm_key_vault_secret.suffix_value.value}")
}

# ======================================================
# Creates Storage Account
# ======================================================
resource "azurerm_storage_account" "asa" {
  name                      = local.resource_name
  resource_group_name       = data.azurerm_resource_group.project_resource_group.name
  location                  = data.azurerm_resource_group.project_resource_group.location
  account_kind              = var.asa_kind
  account_tier              = var.asa_account_tier
  account_replication_type  = var.asa_account_replication_type
  access_tier               = var.asa_access_tier
  enable_https_traffic_only = var.asa_enable_https_traffic_only
  is_hns_enabled            = var.asa_is_hns_enabled

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # custom_domain {
  #   name          = var.asa_custom_domain_name
  #   use_subdomain = var.asa_custom_domain_use_subdomain
  # }
  # identity {
  #   type = "SystemAssigned" // this is currently the only allowed value
  # }

  # blob_properties {
  #   cors_rule {
  #     allowed_headers    = var.asa_blob_properties_cors_rule_allowed_headers
  #     allowed_methods    = var.asa_blob_properties_cors_rule_allowed_methods
  #     allowed_origins    = var.asa_blob_properties_cors_rule_allowed_origins
  #     exposed_headers    = var.asa_blob_properties_cors_rule_exposed_headers
  #     max_age_in_seconds = var.asa_blob_properties_cors_rule_max_age_in_seconds
  #   }
  #   delete_retention_policy {
  #     days = var.asa_blob_properties_delete_retention_policy_days
  #   }
  # }
  # // queue_properties cannot be set when the access_tier is set to BlobStorage
  # queue_properties {
  #   cors_rule {
  #     allowed_headers    = var.asa_queue_properties_cors_rule_allowed_headers
  #     allowed_methods    = var.asa_queue_properties_cors_rule_allowed_methods
  #     allowed_origins    = var.asa_queue_properties_cors_rule_allowed_origins
  #     exposed_headers    = var.asa_queue_properties_cors_rule_exposed_headers
  #     max_age_in_seconds = var.asa_queue_properties_cors_rule_max_age_in_seconds
  #   }
  #   logging {
  #     delete  = var.asa_queue_properties_logging_delete
  #     read    = var.asa_queue_properties_logging_read
  #     version = var.asa_queue_properties_logging_version
  #     write   = var.asa_queue_properties_logging_write
  #     retention_policy_days = var.asa_queue_properties_retention_policy_days
  #   }
  #   minute_metrics {
  #     enabled      = var.asa_queue_properties_minute_metrics_enabled
  #     version      = var.asa_queue_properties_minute_metrics_version
  #     include_apis = var.asa_queue_properties_minute_metrics_include_apis
  #     retention_policy_days = var.asa_queue_properties_minute_metrics_retention_policy_days
  #   }
  #   hour_metrics {
  #     enabled      = var.asa_queue_properties_hour_metrics_enabled
  #     version      = var.asa_queue_properties_hour_metrics_version
  #     include_apis = var.asa_queue_properties_hour_metrics_include_apis
  #     retention_policy_days = var.asa_queue_properties_hour_metrics_retention_policy_days
  #   }
  # }
  # // static_website can only be set when the account_kind is set to StorageV2
  # static_website {
  #   index_document     = var.asa_static_website_index_document
  #   error_404_document = var.asa_static_website_error_404_document
  # }

  # // network_rules
  # network_rules {
  #   default_action = var.asa_network_rules_default_action
  #   bypass         = var.asa_network_rules_bypass
  #   ip_rules       = var.asa_network_rules_ip_rules
  #   virtual_network_subnet_ids =var.asa_network_rules_virtual_network_subnet_ids
  # }

  # tags = data.azurerm_resource_group.project_resource_group.tags

  count = (var.resource_deploy ? 1 : 0)
}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_storage_account.asa : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

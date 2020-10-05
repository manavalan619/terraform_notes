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
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib = "Contributor"
  reader  = "Reader"

  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // afa Project naming convention
  resource_name = lower("afa-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}
# ======================================================
# Creates Function App
# ======================================================
resource "azurerm_function_app" "afa" {
  name                      = local.resource_name
  location                  = data.azurerm_resource_group.project_resource_group.location
  resource_group_name       = data.azurerm_resource_group.project_resource_group.name
  app_service_plan_id       = var.afa_aasp_id
  storage_connection_string = var.afa_asa_connection_string
  app_settings              = var.afa_app_settings
  enable_builtin_logging    = var.afa_enable_builtin_logging

  site_config {
    always_on                 = var.afa_site_config_always_on
    use_32_bit_worker_process = var.afa_site_config_use32_bit_worker_process
    websockets_enabled        = var.afa_site_config_websockets_enabled
    http2_enabled             = var.afa_site_config_http2_enabled
    min_tls_version           = var.afa_site_config_min_tls_version
    ftps_state                = var.afa_site_config_ftps_state
    cors {
      allowed_origins     = var.afa_site_config_cors_allowed_origins
      support_credentials = var.afa_site_config_cors_support_credentials
    }
    // (Temporary) unmanaged attributes in site_config block (will be included in the scope later) :
    # linux_fx_version = var.afa_site_config_linux_fx_version
    # ip_restriction {
    #   ip_address = var.afa_site_config_ip_restriction_ip_address
    #   subnet_id  = var.afa_site_config_ip_restriction_subnet_id
    # }
  }

  client_affinity_enabled = var.afa_client_affinity_enabled
  enabled                 = var.afa_enabled
  https_only              = var.afa_https_only

  identity {
    type = "SystemAssigned"
  }

  version = var.afa_runtime_version

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # auth_settings {
  #   enabled = var.afa_auth_settings_enabled
  #   active_directory {
  #     client_id = var.afa_auth_settings_active_directory_client_id
  #     client_secret = var.afa_auth_settings_active_directory_client_secret
  #     allowed_audiences = var.afa_auth_settings_active_directory_allowed_audiences
  #   }
  #   additional_login_params = var.afa_auth_settings_additional_login_params
  #   allowed_external_redirect_urls = var.afa_auth_settings_allowed_external_redirect_urls
  #   default_provider = var.afa_auth_settings_default_provider
  #   issuer = var.afa_auth_settings_issuer
  #   facebook {
  #     app_id = var.afa_auth_settings_facebook_app_id
  #     app_secret = var.afa_auth_settings_facebook_app_secret
  #     oauth_scopes = var.afa_auth_settings_facebook_oauth_scopes
  #   }
  #   google {
  #     client_id = var.afa_auth_settings_google_client_id
  #     client_secret = var.afa_auth_settings_google_client_secret
  #     oauth_scopes = var.afa_auth_settings_google_oauth_scopes
  #   }
  #   microsoft {
  #     client_id = var.afa_auth_settings_microsoft_client_id
  #     client_secret = var.afa_auth_settings_microsoft_client_secret
  #     oauth_scopes = var.afa_auth_settings_microsoft_oauth_scopes
  #   }
  #   runtime_version = var.afa_auth_settings_runtime_version
  #   token_refresh_extension_hours = var.afa_auth_settings_token_refresh_extension_hours
  #   token_store_enabled = var.afa_auth_settings_token_store_enabled
  #   twitter {
  #     client_id = var.afa_auth_settings_twitter_client_id
  #     client_secret = var.afa_auth_settings_twitter_client_secret
  #     oauth_scopes = var.afa_auth_settings_twitter_oauth_scopes
  #   }
  #   unauthenticated_client_action = var.afa_auth_settings_unauthenticated_client_action
  # }

  # connection_string {
  #   name  = var.afa_connection_string_name
  #   type  = var.afa_connection_string_type
  #   value = var.afa_connection_string_value
  # }
  # os_type                 = var.afa_os_type
  # version                 = var.afa_runtime_version
  # daily_memory_time_quota = var.afa_daily_memory_time_quota

  # timeouts {
  #   create = var.afa_timeouts_create
  #   update = var.afa_timeouts_update
  #   read   = var.afa_timeouts_read
  #   delete = var.afa_timeouts_delete
  # }

  tags = data.azurerm_resource_group.project_resource_group.tags

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]

}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_function_app.afa : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}

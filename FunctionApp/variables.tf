variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Function App."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "short_project_name" {
  type        = string
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_index" {
  type        = string
  description = "Resource Index"
}

# ==============================================================================
# Function App - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "afa_asa_connection_string" {
  type        = string
  description = "Required The connection string of the backend storage account which will be used by this Function App (such as the dashboard, logs)"
}
variable "afa_app_settings" {
  type        = map
  description = "Optional A key-value pair of App Settings."
}
variable "afa_enable_builtin_logging" {
  type        = bool
  description = "(Optional) Should the built-in logging of this Function App be enabled? Defaults to true."
  default     = true
}
variable "afa_site_config_always_on" {
  type        = bool
  description = "(Optional) Should the Function App be loaded at all times? types to false."
  default     = false
}
variable "afa_site_config_ftps_state" {
  type        = string
  description = "Optional State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled."
  default     = "Disabled"
}
variable "afa_site_config_http2_enabled" {
  type        = bool
  description = "(Optional) Specifies whether or not the http2 protocol should be enabled. Defaults to false."
  default     = false
}
variable "afa_site_config_min_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for the function app. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new function apps."
  default     = "1.2"
}
variable "afa_site_config_use32_bit_worker_process" {
  type        = bool
  description = "(Optional) Should the Function App run in 32 bit mode, rather than 64 bit"
  default     = true
}
variable "afa_site_config_websockets_enabled" {
  type        = bool
  description = "(Optional) Should WebSockets be enabled?"
  default     = false
}
variable "afa_site_config_cors_allowed_origins" {
  type        = list(string)
  description = "(Optional) A list of origins which should be able to make cross-origin calls. * can be used to allow all calls."
  default     = ["*"]
}
variable "afa_site_config_cors_support_credentials" {
  type        = bool
  description = "(Optional) Are credentials supported?"
  default     = false
}
variable "afa_client_affinity_enabled" {
  type        = bool
  description = "(Optional) Should the Function App send session affinity cookies, which route client requests in the same session to the same instance?"
  default     = false
}
variable "afa_enabled" {
  type        = bool
  description = "(Optional) Is the Function App enabled?"
  default     = true
}
variable "afa_https_only" {
  type        = bool
  description = "(Optional) Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = false
}
variable "afa_runtime_version" {
  type        = string
  description = "(Optional) The runtime version associated with the Function App. Defaults to ~1."
  default     = "~2"
}
variable "afa_aasp_id" {
  type        = string
  description = "Required The ID of the App Service Plan within which to create this Function App."
}
# // (Temporary) unmanaged attributes in site_config block (will be included in the scope later) :
# variable "afa_site_config_linux_fx_version" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_site_config_ip_restriction_ip_address" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_site_config_ip_restriction_subnet_id" {
#   type        = string
#   description = ""
#   default     = null
# }

#  // (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "afa_auth_settings_enabled" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_active_directory_client_id" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_active_directory_client_secret" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_active_directory_allowed_audiences" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_auth_settings_additional_login_params" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_allowed_external_redirect_urls" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_default_provider" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_issuer" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_facebook_app_id" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_facebook_app_secret" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_facebook_oauth_scopes" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_auth_settings_google_client_id" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_google_client_secret" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_google_oauth_scopes" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_auth_settings_microsoft_client_id" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_microsoft_client_secret" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_microsoft_oauth_scopes" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_runtime_version" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_token_refresh_extension_hours" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_token_store_enabled" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_auth_settings_twitter_client_id" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_twitter_client_secret" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_auth_settings_twitter_oauth_scopes" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_auth_settings_unauthenticated_client_action" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_connection_string_name" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_connection_string_type" {
#   type        = string
#   description = ""
#   default     = null
# }
# variable "afa_connection_string_value" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_os_type" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_daily_memory_time_quota" {
#   type        = string
#   description = ""
#   default     = null
# }

# variable "afa_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the Function App."
#   default     = "30m"
# }
# variable "afa_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the Function App."
#   default     = "30m"
# }
# variable "afa_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the Function App."
#   default     = "5m"
# }
# variable "afa_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the Function App."
#   default     = "30m"
# }

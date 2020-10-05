variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
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
# ==============================================================================
# Storage Account - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "asa_account_tier" {
  type        = string
  description = "Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
}
variable "asa_account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}
variable "asa_kind" {
  type        = string
  description = "Optional Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to Storage."
}
variable "asa_access_tier" {
  type        = string
  description = "Optional Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  default     = "Hot"
}
variable "asa_enable_https_traffic_only" {
  type        = bool
  description = "Optional Boolean flag which forces HTTPS if enabled"
}
variable "asa_is_hns_enabled" {
  description = "Optional Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2"
  type        = bool
  default     = false
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "asa_custom_domain_name" {
#   type        = string
#   description = "(Optional) The Custom Domain Name to use for the Storage Account, which will be validated by Azure."
#   default     = null
# }
# variable "asa_custom_domain_use_subdomain" {
#   type        = bool
#   description = "(Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?"
#   default     = null
# }

# // blob_properties block
# variable "asa_blob_properties_cors_rule_allowed_headers" {
#   type        = list(string)
#   description = "(Required) A list of headers that are allowed to be a part of the cross-origin request."
#   default     = null
# }
# variable "asa_blob_properties_cors_rule_allowed_methods" {
#   type        = list(string)
#   description = "(Required) A list of http headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS or PUT."
#   default     = null
# }
# variable "asa_blob_properties_cors_rule_allowed_origins" {
#   type        = list(strin)
#   description = "(Required) A list of origin domains that will be allowed by CORS."
#   default     = null
# }
# variable "asa_blob_properties_cors_rule_exposed_headers" {
#   type        = list(string)
#   description = "(Required) A list of response headers that are exposed to CORS clients."
#   default     = null
# }
# variable "asa_blob_properties_cors_rule_max_age_in_seconds" {
#   type        = number
#   description = "(Required) The number of seconds the client should cache a preflight response."
#   default     = null
# }

# variable "asa_blob_properties_delete_retention_policy_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7."
#   default     = null
# }

# // queue_properties_cors_rule block (cannot be set when the access_tier is set to BlobStorageà)
# variable "asa_queue_properties_cors_rule_allowed_headers" {
#   type        = list(string)
#   description = "(Required) A list of headers that are allowed to be a part of the cross-origin request."
#   default     = null
# }
# variable "asa_queue_properties_cors_rule_allowed_methods" {
#   type        = list(string)
#   description = "(Required) A list of http headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS or PUT."
#   default     = null
# }
# variable "asa_queue_properties_cors_rule_allowed_origins" {
#   type        = list(string)
#   description = "(Required) A list of origin domains that will be allowed by CORS."
#   default     = null
# }
# variable "asa_queue_properties_cors_rule_exposed_headers" {
#   type        = list(string)
#   description = "(Required) A list of response headers that are exposed to CORS clients."
#   default     = null
# }
# variable "asa_queue_properties_cors_rule_max_age_in_seconds" {
#   type        = number
#   description = "(Required) The number of seconds the client should cache a preflight response."
#   default     = null
# }

# // queue_properties_logging block
# variable "asa_queue_properties_logging_delete" {
#   type        = bool
#   description = "(Required) Indicates whether all delete requests should be logged. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_logging_read" {
#   type        = bool
#   description = "(Required) Indicates whether all read requests should be logged. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_logging_version" {
#   type        = string
#   description = "(Required) The version of storage analytics to configure. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_logging_write" {
#   type        = bool
#   description = "(Required) Indicates whether all write requests should be logged. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_retention_policy_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource."
#   default     = null
# }

# // queue_properties_minute_metric block
# variable "asa_queue_properties_minute_metrics_enabled" {
#   type        = bool
#   description = "(Required) Indicates whether minute metrics are enabled for the Queue service. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_minute_metrics_version" {
#   type        = string
#   description = "(Required) The version of storage analytics to configure. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_minute_metrics_include_apis" {
#   type        = bool
#   description = "(Optional) Indicates whether metrics should generate summary statistics for called API operations."
#   default     = null
# }
# variable "asa_queue_properties_minute_metrics_retention_policy_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource."
#   default     = null
# }

# // queue_properties_hour_metrics block
# variable "asa_queue_properties_hour_metrics_enabled" {
#   type        = bool
#   description = "(Required) Indicates whether hour metrics are enabled for the Queue service. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_hour_metrics_version" {
#   type        = string
#   description = "(Required) The version of storage analytics to configure. Changing this forces a new resource."
#   default     = null
# }
# variable "asa_queue_properties_hour_metrics_include_apis" {
#   type        = bool
#   description = "(Optional) Indicates whether metrics should generate summary statistics for called API operations."
#   default     = null
# }
# variable "asa_queue_properties_hour_metrics_retention_policy_days" {
#   type        = number
#   description = "(Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource."
#   default     = null
# }

# // static_website block (can only be set when the account_kind is set to StorageV2)
# variable "asa_static_website_index_document" {
#   type        = string
#   description = "(Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive."
#   default     = null
# }
# variable "asa_static_website_error_404_document" {
#   type        = string
#   description = "(Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file."
#   default     = null
# }

# // network_rules block
# variable "asa_network_rules_default_action" {
#   type        = string
#   description = "(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow."
#   default     = null
# }
# variable "asa_network_rules_bypass" {
#   type        = string
#   description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
#   default     = null
# }
# variable "asa_network_rules_ip_rules" {
#   type        = list(string)
#   description = "(Optional) List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
#   default     = null
# }
# variable "asa_network_rules_virtual_network_subnet_ids" {
#   type        = list(string)
#   description = "(Optional) A list of resource ids for subnets."
#   default     = null
# }
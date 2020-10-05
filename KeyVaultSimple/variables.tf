# ==============================================================================
# DATA - Variables
# ==============================================================================
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Key Vault should be exist. Changing this forces a new resource to be created."
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "resource_index" {
  type        = string
  description = "Resource index for the KeyVault"
}
# ==============================================================================
# KeyVaultSimple - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "akv_sku_name" {
  type        = string
  description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}
variable "akv_enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  default     = true
}
variable "akv_soft_delete_enabled" {
  type        = bool
  description = "(Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false."
  default     = true
}
variable "akv_purge_protection_enabled" {
  type        = bool
  description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
  default     = true
}
variable "akv_enabled_for_deployment" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  default     = false
}
variable "akv_enabled_for_template_deployment" {
  type        = string
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  default     = false
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "akv_network_acls_bypass" {
#   type        = string
#   description = "(Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
# }
# variable "akv_network_acls_default_action" {
#   type        = string
#   description = "(Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
# }
# variable "akv_network_acls_ip_rules" {
#   type        = list(string)
#   description = "(Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
#   default     = null
# }
# variable "akv_network_acls_virtual_network_subnet_ids" {
#   type        = list(string)
#   description = "(Optional) One or more Subnet ID's which should be able to access this Key Vault."
#   default     = null
# }
# variable "akv_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the Key Vault."
#   default     = "30m"
# }
# variable "akv_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the Key Vault."
#   default     = "30m"
# }
# variable "akv_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the Key Vault."
#   default     = "5m"
# }
# variable "akv_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the Key Vault."
#   default     = "30m"
# }

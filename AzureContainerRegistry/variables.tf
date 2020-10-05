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
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# ACR - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# variable "acr_name" {
#   type        = string
#   description = "(Required) Specifies the name of the Container Registry. Changing this forces a new resource to be created."
# }
variable "acr_sku" {
  type        = string
  description = "(Optional) The SKU name of the container registry."
}
variable "acr_admin_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
}
# variable "acr_ip_rule" {
#   type = object({
#     action   = string   // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
#     ip_range = string   // (Required) The CIDR block from which requests will match the rule.
#   })
#   default = null
# }
# variable "acr_vnet" {
#   type = object({
#     action   = string   // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
#     ip_range = string   // (Required) The subnet id from which requests will match the rule.
#   })
#   default = null
# }
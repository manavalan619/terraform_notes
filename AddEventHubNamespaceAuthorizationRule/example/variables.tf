# ==============================================================================
# Data - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventHub Namespace exists. Changing this forces a new resource to be created."
}

variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "short_project_name" {
  type        = string
  description = "Project name"
}

variable "aehn_sku" {
  type        = string
  description = "Required Defines which tier to use. Valid options are Basic and Standard"
  default     = "Standard"
}

variable "aehn_capacity" {
  type        = number
  description = "Optional Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
}

variable "aehn_auto_inflate_enabled" {
  type        = bool
  description = "Optional Is Auto Inflate enabled for the EventHub Namespace"
}

variable "aehn_maximum_throughput_units" {
  type        = number
  description = "Optional Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20"
}

# ==============================================================================
# Event Hub Namespace Authorization Rules - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aehar_name" {
  type        = string
  description = "(Required) Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
}

variable "aehar_listen" {
  type        = string
  description = "(Optional) Grants listen access to this this Authorization Rule. Defaults to false."
  default     = false
}

variable "aehar_send" {
  type        = string
  description = "(Optional) Grants send access to this this Authorization Rule. Defaults to false."
  default     = false
}

variable "aehar_manage" {
  type        = string
  description = "(Optional) Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false."
  default     = false
}

variable "resource_depends_on" {
  type        = any
  default     = null
}
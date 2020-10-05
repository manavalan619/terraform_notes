# ==============================================================================
# Data - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventHub Namespace exists. Changing this forces a new resource to be created."
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
variable "aehar_namespace_name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub Namespace. Changing this forces a new resource to be created."
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
  type    = any
  default = null
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "aehar_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }
# variable "aehar_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }
# variable "aehar_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the EventHub Namespace Authorization Rule."
#   default     = "5m"
# }
# variable "aehar_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }

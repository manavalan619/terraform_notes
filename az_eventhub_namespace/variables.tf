# ==============================================================================
# Local - Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
}

variable "assie_rgTags" {
  type = object({
    Environment     = string
    ApplicationName = string
    ApplicationCode = string
    Branch          = string
    Exploitation    = string
    SecurityLevel   = string
  })
  description = "(optional) Default resource group name that the eventhubs namespace will be created in."
}

variable "assie_rgLocation" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "module_aehnIndex" {
  type        = string
  description = "Resource index for the event hub namespace."
}
# ==============================================================================
# Azure Event Hub Namespace - Variables
# ==============================================================================


variable "module_aehnSku" {
  type        = string
  description = "(Required) Defines which tier to use. Valid options are Basic and Standard"
  default     = "Standard"
}
variable "module_aehnCapacity" {
  type        = number
  description = "(Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
}
variable "module_aehnAutoInflateEnabled" {
  type        = bool
  description = "(Optional) Is Auto Inflate enabled for the EventHub Namespace"
}
variable "module_aehnMaximumThroughputUnits" {
  type        = number
  description = "(Optional) Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20"
}

// (Temporary) unmanaged attributes (will be included in the scope later)
# variable "aehn_network_rulesets_default_action" {
#   type        = string
#   description = "(Required) The default action to take when a rule is not matched. Possible values are Allow and Deny."
#   default     = null
# }

# // virtual_network_rule block
# variable "aehn_network_rulesets_vnet_rule_subnet_id" {
#   type        = string
#   description = "(Required) The id of the subnet to match on."
#   default     = null
# }
# variable "aehn_network_rulesets_vnet_rule_ignore_missing_virtual_network_service_endpoint" {
#   type        = bool
#   description = "(Optional) Are missing virtual network service endpoints ignored? Defaults to false."
#   default     = null
# }

# // ip_rule block
# variable "aehn_network_rulesets_network_rulesets_ip_rule_ip_mask" {
#   type        = string
#   description = "(Required) The ip mask to match on."
#   default     = null
# }
# variable "aehn_network_rulesets_ip_rule_action" {
#   type        = string
#   description = "(Optional) The action to take when the rule is matched. Possible values are Allow."
#   default     = null
# }

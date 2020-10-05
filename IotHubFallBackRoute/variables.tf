# ==============================================================================
# DATA - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group under which the IotHub Storage Container Endpoint resource has to be created. Changing this forces a new resource to be created."
}

variable "asa_name" {
  type        = string
  description = "Required Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}


variable "ascn_name" {
  type        = string
  description = "(Required) Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
}

variable "aioth_name" {
  type        = string
  description = "(Required) The name of the IoTHub to which this Storage Container Endpoint belongs. Changing this forces a new resource to be created."
}


# ==============================================================================
# IOTHUB ROUTE - Variables
# ==============================================================================

variable "aiothfbr_condition" {
  type        = string
  description = "(Optional) The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default."
  default     = "true"
}

variable "aiothfbr_enabled" {
  type        = bool
  description = "(Required) Used to specify whether the fallback route is enabled."
  default     = true
}

variable "aiothfbr_endpoint_names" {
  type        = list(string)
  description = "(Required) The endpoints to which messages that satisfy the condition are routed. Currently only 1 endpoint is allowed."
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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
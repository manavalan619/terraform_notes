# ==============================================================================
# Data Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the subnet should be exist. Changing this forces a new resource to be created."
}

variable "avnet_address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}

variable "avnet_ddos_protection_plan" {
  type = object({
    id     = string
    enable = bool
  })
  default = null
}

variable "avnet_dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers."
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

# ==============================================================================
# Subnet Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "subnet_name" {
  type        = string
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "(Required) The address prefix to use for the subnet."
}

variable "delegations" {
  description = "(Optional) One or more delegation blocks as defined below."
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })

  }))
  default = []

}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}

variable "subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}

variable "subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}
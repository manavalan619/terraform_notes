# ==============================================================================
# DATA - Variables
# ==============================================================================
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}

# ==============================================================================
# Virtual Network Peering - Variables
# ==============================================================================
variable "avnp_name" {
  type        = string
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
}
variable "avnet1_name" {
  type        = string
  description = "Specifies the name of the Virtual Network."
}
variable "avnet2_remote_virtual_network_id" {
  type        = string
  description = "Specifies the name of the Remote Virtual Network."
}
variable "avnp_allow_virtual_network_access" {
  type        = bool
  description = "(Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
  default     = true
}
variable "avnp_allow_forwarded_traffic" {
  type        = bool
  description = "(Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed."
  default     = false
}
variable "avnp_allow_gateway_transit" {
  type        = bool
  description = "(Optional) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  default     = false
}
variable "avnp_use_remote_gateways" {
  type        = bool
  description = "(Optional) Controls if remote gateways can be used on the local virtual network."
  default     = false
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

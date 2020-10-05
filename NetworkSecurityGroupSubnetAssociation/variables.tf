variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# NSG - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "ansg_subnet_subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
} 
variable "ansg_subnet_network_security_group_id" {
  type        = string
  description = "(Required) The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new resource to be created."
} 
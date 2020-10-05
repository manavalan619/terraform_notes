# ==============================================================================
# DATA - Variables
# ==============================================================================
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
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
  description = "Project name"
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
# Databricks worskpace - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# variable "akv_project_name" {
#   type        = string
#   description = "Azure Key Vault project name : to store the Azure Databricks token"
# }
variable "adb_sku" {
  type        = string
  description = "(Required) The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this forces a new resource to be created."
  default     = "standard"
}
variable "adb_custom_parameters" {
  description = ""
  type = object({
    no_public_ip        = bool    // (Optional) Are public IP Addresses not allowed?
    public_subnet_name  = string  // (Optional) The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set.
    private_subnet_name = string  // (Optional) The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set
    virtual_network_id  = string  // (Optional) The ID of a Virtual Network where this Databricks Cluster should be created.
  })
  default = null
}

# variable "custom_parameters_no_public_ip" {
#   type        = bool
#   description = "(Optional) Are public IP Addresses not allowed?"
#   default     = true
# }
# variable "custom_parameters_public_subnet_name" {
#   type        = string
#   description = "(Optional) The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set."
#   default     = ""
# }
# variable "custom_parameters_private_subnet_name"  {
#   type        = string
#   description = "(Optional) The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set."
#   default     = ""
# }
# variable "custom_parameters_virtual_network_id" {
#   type        = string
#   description = "(Optional) The ID of a Virtual Network where this Databricks Cluster should be created."
#   default     = ""
# }

// (Temporary) unmanaged attributes (will be included in the scope later) :

# variable "adb_managed_resource_group_name" {
#   type        = string
#   description = "(Optional) The name of the resource group where Azure should place the managed Databricks resources. Changing this forces a new resource to be created."
#   default     = null
# }
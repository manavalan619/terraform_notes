# ==============================================================================
# DATA - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}


variable "avnet_name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "private_subnet_name" {
  type        = string
  description = "(Optional) The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set."
}

variable "public_subnet_name" {
  type        = string
  description = "(Optional) The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set."
}

variable "no_public_ip" {
  type        = bool
  description = "(Optional) Are public IP Addresses not allowed?"
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
# ==============================================================================
# Databricks worskpace - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "akv_project_name" {
  type        = string
  description = "Azure Key Vault project name : to store the Azure Databricks token"
}
variable "adb_sku" {
  type        = string
  description = "(Required) The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this forces a new resource to be created."
  default     = "standard"
}

variable "custom_parameters" {
  description = ""
  type = object({
    no_public_ip        = bool
    public_subnet_name  = string
    private_subnet_name = string
    virtual_network_id  = string
  })
  default = null
}
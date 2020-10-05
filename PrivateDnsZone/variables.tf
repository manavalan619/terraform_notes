variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StorageContainer Services Server should be exist. Changing this forces a new resource to be created."
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
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_index" {
  type        = string
  description = "Resource index"
}
variable "resource_depends_on" {
  type    = any
  default = null
}
# ==================================================================================
# Azure Private DNS Zone - Variables
# ==================================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "private_dns_zone_name" {
  type        = string 
  description = "(Required) The name of the Private DNS Zone. Must be a valid domain name."
}
variable "pdz_virtual_network_id" {
  type        = string
  description = "(Required) The Resource ID of the Virtual Network that should be linked to the DNS Zone. Changing this forces a new resource to be created."
}
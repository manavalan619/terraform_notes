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
# ==================================================================================
# Azure Public IP - Variables
# ==================================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "apip_sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Standard"
}
variable "apip_allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}
variable "apip_ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, IPv6 or IPv4."
  default     = "IPv4"
}
variable "apip_domain_name_label" {
  type        = string
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
}
variable "apip_reverse_fqdn" {
  type        = string
  description = "Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN."
}
# variable "apip_public_ip_prefix_id" {
#   type        = string
#   description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource."
# }
variable "apip_zones" {
  type        = list(number)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in."
}
variable "apip_idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  default = 30
}

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the application gateway should be exist. Changing this forces a new resource to be created."
}
# ==============================================================================
# Application Gateway variables
# ==============================================================================
variable "appgw_name" {
  type        = string
  description = "(Required) The name of the Application Gateway. Changing this forces a new resource to be created."
}
variable "appgw_sku_name" {
  type        = string
  description = "(Required) The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
}
variable "appgw_sku_tier" {
  type        = string
  description = "(Required) The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
}
variable "appgw_gateway_ip_configuration_subnet_id" {
  type        = string
  description = "(Required) The ID of a Subnet."
}
variable "appgw_frontend_ip_configuration_public_ip_address_id" {
  type        = string
  description = "(Optional) The ID of a Public IP Address which the Application Gateway should use."
}
variable "http_listener" {
  description = "(Required) One or more http_listener blocks as defined."
  type = object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    protocol                       = string
  })
}
variable "request_routing_rule" {
  description = "(Required) One or more request_routing_rule blocks as defined."
  type = object({
    name                       = string
    rule_type                  = string
    http_listener_name         = string
    backend_address_pool_name  = string
    backend_http_settings_name = string
  })
}
variable "appgw_backend_address_pool_ip_addresses" {
  type        = string
  description = "(Optional) A list of IP Addresses which should be part of the Backend Address Pool."
}
variable "backend_http_settings" {
  description = "(Required) One or more backend_http_settings blocks as defined."
  type = object({
    name                  = string
    cookie_based_affinity = string
    path                  = string
    port                  = number
    protocol              = string
    request_timeout       = number
  })
  default = null
}

variable "probe" {
  description = "(Optional) One or more probe blocks as defined."
  type = object({
    host                                      = string
    interval                                  = number
    name                                      = string
    protocol                                  = string
    path                                      = string
    timeout                                   = number
    unhealthy_threshold                       = number
    pick_host_name_from_backend_http_settings = bool
    minimum_servers                           = number
  })
}
variable "identity" {
  description = "(Optional) A identity block."
  type = object({
    identity_ids = list(string)
    type         = string
  })
}
variable "match" {
  description = "(Optional) A match block as defined"
  type = object({
    body        = string
    status_code = list(string)
  })
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

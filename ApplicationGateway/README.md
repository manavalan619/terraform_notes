# Module ApplicationGateway

`The development of this module is currently in progress`

## Description

This module creates an Azure ApplicationGateway

## Usage

### Module Definitions

- module location : providers/azure/ApplicationGateway

  ```hcl
  module "appgw" {
  source = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/ApplicationGateway/"
  project_resource_group_name = var.project_resource_group_name
  appgw_name = var.appgw_name
  appgw_sku_name = var.appgw_sku_name
  appgw_sku_tier = var.appgw_sku_tier
  appgw_gateway_ip_configuration_subnet_id = var.appgw_gateway_ip_configuration_subnet_id
  appgw_frontend_ip_configuration_public_ip_address_id = var.appgw_frontend_ip_configuration_public_ip_address_id
  http_listener = var.http_listener
  request_routing_rule = var.request_routing_rule
  appgw_backend_address_pool_ip_addresses = var.appgw_backend_address_pool_ip_addresses
  backend_http_settings = var.backend_http_settings
  probe = var.probe
  match = var.match
  identity = var.identity
  resource_deploy = var.resource_deploy
  }
  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the application gateway should be exist. Changing this forces a new resource to be created."
}
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
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "appgw_id" {
  description = "The ID of the Application Gateway."
  value       = module.appgw.appgw_id
}
output "appgw_authentication_certificate" {
  description = "A authentication_certificate block exporting the iD of the Authentication Certificate."
  value       = module.appgw.appgw_authentication_certificate
}
output "appgw_backend_address_pool" {
  description = "A list of backend_address_pool blocks. Export of The ID of the Backend Address Pool"
  value       = module.appgw.appgw_backend_address_pool
}
output "appgw_backend_http_settings" {
  description = "A list of backend_http_settings blocks. Export of The ID of the Backend HTTP Settings Configuration + The ID of the associated Probe."
  value       = module.appgw.appgw_backend_http_settings
}
output "appgw_frontend_ip_configuration" {
  description = "A list of frontend_ip_configuration blocks. Export of The ID of the Frontend Port."
  value       = module.appgw.appgw_frontend_ip_configuration
}
output "appgw_frontend_port" {
  description = "A list of frontend_port blocks."
  value       = module.appgw.appgw_frontend_port
}
output "appgw_gateway_ip_configuration" {
  description = "A list of gateway_ip_configuration blocks. Export of The ID of the Gateway IP Configuration."
  value       = module.appgw.appgw_frontend_ip_configuration
}
output "appgw_enable_http2" {
  description = "(Optional) Is HTTP2 enabled on the application gateway resource? Defaults to false."
  value       = module.appgw.appgw_enable_http2
}
output "appgw_http_listener" {
  description = "A list of http_listener blocks as defined below. Export of the ID of the HTTP Listener, The ID of the associated Frontend Configuration, the ID of the associated Frontend Port"
  value       = module.appgw.appgw_http_listener
}
output "appgw_probe" {
  description = "A probe block. Export of The Name of the Probe, The Hostname used for this Probe, The Interval between two consecutive probes in seconds, "
  value       = module.appgw.appgw_probe
}
output "appgw_request_routing_rule" {
  description = "A list of request_routing_rule blocks. Export of The ID of the Request Routing Rule,  The ID of the associated HTTP Listener, The ID of the associated Backend Address Pool, etc.."
  value       = module.appgw.appgw_request_routing_rule
}
output "appgw_ssl_certificate" {
  description = "A list of ssl_certificate blocks. Export of The Name of the SSL certificate that is unique within this Application Gateway, etc"
  value       = module.appgw.appgw_ssl_certificate
}
output "appgw_url_path_map" {
  description = "A list of url_path_map blocks. Export of The Name of the URL Path Map, the default_backend_address_pool_name etc."
  value       = module.appgw.appgw_url_path_map
}
output "appgw_custom_error_configuration" {
  description = "A list of custom_error_configuration blocks. Export of The ID of the Custom Error Configuration"
  value       = module.appgw.appgw_custom_error_configuration
}
output "appgw_redirect_configuration" {
  description = "A list of redirect_configuration blocks. Export of The ID of the Redirect Configuration."
  value       = module.appgw.appgw_redirect_configuration
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name   = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name   = "RG-TOTAL-WU-GEORGE-P"
  ```

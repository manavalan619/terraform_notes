# ==============================================================================
# Application Gateway Output variables
# ==============================================================================
output "appgw_id" {
  description = "The ID of the Application Gateway."
  value       = [for instance in azurerm_application_gateway.appgw : instance.id]
}
output "appgw_authentication_certificate" {
  description = "A authentication_certificate block exporting the iD of the Authentication Certificate."
  value       = [for instance in azurerm_application_gateway.appgw : instance.authentication_certificate]
}
output "appgw_backend_address_pool" {
  description = "A list of backend_address_pool blocks. Export of The ID of the Backend Address Pool"
  value       = [for instance in azurerm_application_gateway.appgw : instance.backend_address_pool]
}
output "appgw_backend_http_settings" {
  description = "A list of backend_http_settings blocks. Export of The ID of the Backend HTTP Settings Configuration + The ID of the associated Probe."
  value       = [for instance in azurerm_application_gateway.appgw : instance.backend_http_settings]
}
output "appgw_frontend_ip_configuration" {
  description = "A list of frontend_ip_configuration blocks. Export of The ID of the Frontend Port."
  value       = [for instance in azurerm_application_gateway.appgw : instance.frontend_ip_configuration]
}
output "appgw_frontend_port" {
  description = "A list of frontend_port blocks."
  value       = [for instance in azurerm_application_gateway.appgw : instance.frontend_port]
}
output "appgw_gateway_ip_configuration" {
  description = "A list of gateway_ip_configuration blocks. Export of The ID of the Gateway IP Configuration."
  value       = [for instance in azurerm_application_gateway.appgw : instance.gateway_ip_configuration]
}
output "appgw_enable_http2" {
  description = "(Optional) Is HTTP2 enabled on the application gateway resource? Defaults to false."
  value       = [for instance in azurerm_application_gateway.appgw : instance.enable_http2]
}
output "appgw_http_listener" {
  description = "A list of http_listener blocks as defined below. Export of the ID of the HTTP Listener, The ID of the associated Frontend Configuration, the ID of the associated Frontend Port"
  value       = [for instance in azurerm_application_gateway.appgw : instance.http_listener]
}
output "appgw_probe" {
  description = "A probe block. Export of The Name of the Probe, The Hostname used for this Probe, The Interval between two consecutive probes in seconds, "
  value       = [for instance in azurerm_application_gateway.appgw : instance.probe]
}
output "appgw_request_routing_rule" {
  description = "A list of request_routing_rule blocks. Export of The ID of the Request Routing Rule,  The ID of the associated HTTP Listener, The ID of the associated Backend Address Pool, etc.."
  value       = [for instance in azurerm_application_gateway.appgw : instance.request_routing_rule]
}
output "appgw_ssl_certificate" {
  description = "A list of ssl_certificate blocks. Export of The Name of the SSL certificate that is unique within this Application Gateway, etc"
  value       = [for instance in azurerm_application_gateway.appgw : instance.ssl_certificate]
}
output "appgw_url_path_map" {
  description = "A list of url_path_map blocks. Export of The Name of the URL Path Map, the default_backend_address_pool_name etc."
  value       = [for instance in azurerm_application_gateway.appgw : instance.url_path_map]
}
output "appgw_custom_error_configuration" {
  description = "A list of custom_error_configuration blocks. Export of The ID of the Custom Error Configuration"
  value       = [for instance in azurerm_application_gateway.appgw : instance.custom_error_configuration]
}
output "appgw_redirect_configuration" {
  description = "A list of redirect_configuration blocks. Export of The ID of the Redirect Configuration."
  value       = [for instance in azurerm_application_gateway.appgw : instance.redirect_configuration]
}

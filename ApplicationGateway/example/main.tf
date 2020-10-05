# ======================================================
# creating ApplicationGateway
# ======================================================
module "appgw" {
  source                                               = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/ApplicationGateway/"
  project_resource_group_name                          = var.project_resource_group_name
  appgw_name                                           = var.appgw_name
  appgw_sku_name                                       = var.appgw_sku_name
  appgw_sku_tier                                       = var.appgw_sku_tier
  appgw_gateway_ip_configuration_subnet_id             = var.appgw_gateway_ip_configuration_subnet_id
  appgw_frontend_ip_configuration_public_ip_address_id = var.appgw_frontend_ip_configuration_public_ip_address_id
  http_listener                                        = var.http_listener
  request_routing_rule                                 = var.request_routing_rule
  appgw_backend_address_pool_ip_addresses              = var.appgw_backend_address_pool_ip_addresses
  backend_http_settings                                = var.backend_http_settings
  probe                                                = var.probe
  match                                                = var.match
  identity                                             = var.identity
  resource_deploy                                      = var.resource_deploy
}





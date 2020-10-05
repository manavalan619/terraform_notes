project_resource_group_name                          = "RG-TOTAL-WU-GEORGE"
appgw_name                                           = "appgw-dv-ne-test-george"
appgw_sku_name                                       = "WAF_v2"
appgw_sku_tier                                       = "WAF_v2"
appgw_gateway_ip_configuration_subnet_id             = "/subscriptions/47ea923d-bbfb-4cae-a53b-6ae79b0d836f/resourceGroups/RG-TOTAL-WU-GEORGE/providers/Microsoft.Network/virtualNetworks/vnet-dv-test-george/subnets/default"
appgw_frontend_ip_configuration_public_ip_address_id = "/subscriptions/47ea923d-bbfb-4cae-a53b-6ae79b0d836f/resourceGroups/RG-TOTAL-WU-GEORGE/providers/Microsoft.Network/publicIPAddresses/pip-dv-test-george-1"
http_listener = {
  name                           = "vnet-dv-test-george-httplstn"
  frontend_ip_configuration_name = "vnet-dv-test-george-feip"
  frontend_port_name             = "vnet-dv-test-george-feport"
  protocol                       = "Http"
}
request_routing_rule = {
  name                       = "vnet-dv-test-george-rqrt"
  rule_type                  = "Basic"
  http_listener_name         = "vnet-dv-test-george-httplstn"
  backend_address_pool_name  = "test-dv-api"
  backend_http_settings_name = "vnet-dv-test-george-be-htst"
}
appgw_backend_address_pool_ip_addresses = "172.18.2.0"
backend_http_settings = {
  name                  = "vnet-dv-test-george-be-htst"
  cookie_based_affinity = "Disabled"
  path                  = "/path1/"
  port                  = 80
  protocol              = "Http"
  request_timeout       = 1
}
probe = {
  host                                      = "test-dv-portal.azr.tgscloud.net"
  interval                                  = 30
  minimum_servers                           = 0
  name                                      = "test-dv-portal-probe"
  path                                      = "/signin"
  pick_host_name_from_backend_http_settings = false
  protocol                                  = "Http"
  timeout                                   = 30
  unhealthy_threshold                       = 3
}
identity = {
  type         = "UserAssigned"
  identity_ids = ["/subscriptions/47ea923d-bbfb-4cae-a53b-6ae79b0d836f/resourceGroups/RG-TOTAL-WU-GEORGE/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uai-test-george"]
}
match = {
  body        = null
  status_code = ["200-399"]
}
resource_deploy = true

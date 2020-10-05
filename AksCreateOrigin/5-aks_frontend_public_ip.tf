# ==================================================================================
# Creates Public IP to be attached on the app gateway frontend
# ==================================================================================
resource "azurerm_public_ip" "aks_app_gateway_frontend_public_ip" {
  # count                   = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count                   = var.deploy_aks ? 1 : 0
  name                    = local.aks_app_gateway_frontend_public_ip_target_name // "appgw-frontend-public-ip-${var.short_project_name}-${var.env_code}"
  resource_group_name     = data.azurerm_resource_group.project_resource_group.name
  location                = data.azurerm_resource_group.project_resource_group.location
  sku                     = var.aks_appgw_public_ip_sku                 // ("Standard" is hard coded for CCE team)
  allocation_method       = var.aks_appgw_public_ip_allocation_method   // ("Static" is harded coded for CCE team)
  idle_timeout_in_minutes = 30
  domain_name_label       = "${local.aks_cluster_target_name}-appgw-publicip-domain"

  tags                    = data.azurerm_resource_group.project_resource_group.tags

}
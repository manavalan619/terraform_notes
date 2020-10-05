# ==================================================================================================
# Creates A Dedicated VNET with 3 subnets
# - one subnet dedicated to Aks
# - one subnet dedicated to App Gateway
# - one subnet dedicated to APIM
# Carrefull to not overlap with CIDR adress spaces ranges and take a sufficient large range of Ips!
# ==================================================================================================
resource "azurerm_virtual_network" "aks_vnet" {   
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  count               = var.deploy_aks ? 1 : 0
  name                = local.aks_vnet_target_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  address_space       = var.aks_vnet_address_space    // e.g ["10.0.0.0/16"]

  dynamic "ddos_protection_plan" {
    for_each = local.aks_vnet_ddos_plan_enabled == true ? [1] : [] 
    content {
      id     = local.aks_vnet_ddos_plan_id
      enable = local.aks_vnet_ddos_plan_enabled
    }
  }

  tags = data.azurerm_resource_group.project_resource_group.tags
}

// kubesubnet
resource "azurerm_subnet" "aks_subnet" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  count                = var.deploy_aks ? 1 : 0
  name                 = local.aks_subnet_target_name
  resource_group_name  = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name = local.aks_vnet_target_name // azurerm_virtual_network.aks_vnet[0].name
  address_prefix       = var.aks_subnet_docker_cidr         // corresponds to docker cidr  /17
  # service_endpoints    = ["Microsoft.Sql", "Microsoft.ServiceBus", "Microsoft.Storage", "Microsoft.Web"] // (Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
  depends_on = [azurerm_virtual_network.aks_vnet]
} 

// appgwsubnet
resource "azurerm_subnet" "appgw_subnet" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  count                = var.deploy_aks ? 1 : 0
  name                 = local.aks_app_gw_subnet_target_name
  resource_group_name  = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name = local.aks_vnet_target_name // azurerm_virtual_network.aks_vnet[0].name
  address_prefix       = var.appgw_subnet_cidr         // corresponds to app gateway cidr /25
  # enforce_private_link_endpoint_network_policies = false   // (Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies.
  # enforce_private_link_service_network_policies  = false   // (Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies.
  depends_on = [azurerm_virtual_network.aks_vnet]
}

// apim subnet 
resource "azurerm_subnet" "apim_subnet" {
  count                     = var.deploy_aks ? 1 : 0
  name                      = local.aks_apim_subnet_target_name// "SN-TOTAL-${upper(var.env_code)}-${upper(var.loc)}-API"
  resource_group_name       = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name      = local.aks_vnet_target_name
  address_prefix            = var.apim_subnet_cidr
  # network_security_group_id = azurerm_network_security_group.apim_nsg.id // depracated : https://github.com/terraform-providers/terraform-provider-azurerm/issues/3054
  depends_on = [azurerm_virtual_network.aks_vnet]
}

// apim subnet (tmp commented)
# resource "azurerm_subnet" "aks-apim-subnet" {
#   count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
#   name                 = local.aks_apim_subnet_target_name
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
#   virtual_network_name = azurerm_virtual_network.aks_vnet[0].name
#   address_prefix       = var.aks_subnet_apim_subnet_cidr          // corresponds to app gateway cidr /25
#   enforce_private_link_endpoint_network_policies = false   // (Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies.
#   enforce_private_link_service_network_policies  = false   // (Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies.
# }

# data "azurerm_subnet" "kubesubnet" {
#   count                = var.deploy_aks ? 1 : 0
#   name                 = azurerm_subnet.aks_subnet[0].name // local.aks_subnet_target_name       // "kubesubnet"
#   virtual_network_name = azurerm_virtual_network.aks_vnet[0].name // local.aks_vnet_target_name 
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
# }

# data "azurerm_subnet" "appgwsubnet" {
#   count                = var.deploy_aks ? 1 : 0
#   name                 = azurerm_subnet.appgw_subnet[0].name // local.aks_app_gw_subnet_target_name // "appgwsubnet"
#   virtual_network_name = azurerm_virtual_network.aks_vnet[0].name // local.aks_vnet_target_name 
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
# } 

# data "azurerm_subnet" "apimsubnet" {
#   count                = var.deploy_aks ? 1 : 0
#   name                 = azurerm_subnet.apim_subnet[0].name // local.aks_app_gw_subnet_target_name // "appgwsubnet"
#   virtual_network_name = azurerm_virtual_network.aks_vnet[0].name // local.aks_vnet_target_name 
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
# } 

// Role Assignment to give AKS SP the contributor access to the VNET - Required for Advanced Networking
# resource "azurerm_role_assignment" "aks-vnet-role" {
#   count                = var.aks_advanced_networking_enabled ? 1 : 0
#   scope                = azurerm_virtual_network.aks_vnet[0].id
#   role_definition_name = "Contributor"
#   principal_id         = var.aks_service_principal_object_id
# }


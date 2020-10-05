# ==================================================================================================
# Creates A Dedicated VNET with 4 subnets
# - one subnet dedicated to AKS
# - one subnet dedicated to SQLDB
# - one subnet dedicated to APIM
# - one subnet dedicated to App Gateway
# Carrefull to not overlap with CIDR adress spaces ranges and take a sufficient large range of Ips!
# ==================================================================================================
module "vnet_aks" {
  resource_deploy             = var.aks_resource_deploy
  source                      = "../VirtualNetwork/" 
  resource_index              = local.aks_resource_index
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  project_resource_group_name = var.project_resource_group_name
  env_code                    = var.env_code
  avnet_address_space         = var.aks_avnet_address_space
  avnet_dns_servers           = var.aks_avnet_dns_servers
  ddos_protection_plan        = var.aks_ddos_protection_plan
}

# ==============================================================================
# aks_kube_subnet
# ==============================================================================
module "aks_kube_subnet" {
  source                                                = "../Subnet/" 
  resource_deploy                                       = var.aks_resource_deploy
  subnet_name                                           = local.aks_kubesubnet_target_name // = "kubesubnet"
  project_resource_group_name                           = var.project_resource_group_name
  subnet_virtual_network_name                           = var.aks_resource_deploy ? module.vnet_aks.avnet_name[0] : ""
  subnet_address_prefix                                 = var.aks_kube_subnet_address_prefix
  subnet_enforce_private_link_endpoint_network_policies = var.aks_kube_subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.aks_kube_subnet_enforce_private_link_service_network_policies
  subnet_service_endpoints                              = var.aks_kube_subnet_service_endpoints
  # delegations                                           = var.aks_kube_delegations
  resource_depends_on                                   = [module.vnet_aks]
}

# ==============================================================================
# sql_subnet (TODO : à incorper au SQLDB module venetisé)
# ==============================================================================
# module "aks_sql_subnet" {
#   source                                                = "../Subnet/" 
#   resource_deploy                                       = var.aks_resource_deploy
#   subnet_name                                           = local.aks_sqlsubnet_target_name // = "sqlsubnet"
#   project_resource_group_name                           = var.project_resource_group_name
#   subnet_virtual_network_name                           = var.aks_resource_deploy ? module.vnet_aks.avnet_name[0] : ""
#   subnet_address_prefix                                 = var.aks_sql_subnet_address_prefix
#   subnet_enforce_private_link_endpoint_network_policies = var.aks_sql_subnet_enforce_private_link_endpoint_network_policies
#   subnet_enforce_private_link_service_network_policies  = var.aks_sql_subnet_enforce_private_link_service_network_policies
#   subnet_service_endpoints                              = var.aks_sql_subnet_service_endpoints
#   # delegations                                           = var.aks_kube_delegations
#   resource_depends_on                                   = [module.vnet_aks]
# }

# ==============================================================================
# apim_subnet
# ==============================================================================
module "aks_apim_subnet" {
  source                                                = "../Subnet/" 
  resource_deploy                                       = var.aks_resource_deploy
  subnet_name                                           = local.aks_apimsubnet_target_name // = "apimsubnet"
  project_resource_group_name                           = var.project_resource_group_name
  subnet_virtual_network_name                           = var.aks_resource_deploy ? module.vnet_aks.avnet_name[0] : ""
  subnet_address_prefix                                 = var.aks_apim_subnet_address_prefix
  subnet_enforce_private_link_endpoint_network_policies = var.aks_apim_subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.aks_apim_subnet_enforce_private_link_service_network_policies
  subnet_service_endpoints                              = var.aks_apim_subnet_service_endpoints
  # delegations                                           = var.aks_kube_delegations
  resource_depends_on                                   = [module.vnet_aks]
}

# ==============================================================================
# appgw_subnet 
# ==============================================================================
module "aks_appgw_subnet" {
  source                                                = "../Subnet/" 
  resource_deploy                                       = var.aks_resource_deploy
  subnet_name                                           = local.aks_appgwsubnet_target_name // = "appgwsubnet"
  project_resource_group_name                           = var.project_resource_group_name
  subnet_virtual_network_name                           = var.aks_resource_deploy ? module.vnet_aks.avnet_name[0] : ""
  subnet_address_prefix                                 = var.aks_appgw_subnet_address_prefix
  subnet_enforce_private_link_endpoint_network_policies = var.aks_appgw_subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.aks_appgw_subnet_enforce_private_link_service_network_policies
  subnet_service_endpoints                              = var.aks_appgw_subnet_service_endpoints
  # delegations                                           = var.aks_kube_delegations
  resource_depends_on                                   = [module.vnet_aks]
}
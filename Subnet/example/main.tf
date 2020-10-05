# ==============================================================================
# DATA  MODULES
# ==============================================================================
#Create network ddos protection plan service

module "network_ddos_protection_plan" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkDdosProtectionPlan/"
  project_resource_group_name = var.project_resource_group_name
  resource_deploy             = var.resource_deploy
}

#Create virtual network 
module "virtual-network" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetwork/"
  project_resource_group_name = var.project_resource_group_name
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  avnet_address_space         = var.avnet_address_space
  avnet_dns_servers           = var.avnet_dns_servers
  resource_deploy             = var.resource_deploy

  avnet_ddos_protection_plan = {
    id     = length(module.network_ddos_protection_plan.andpl_id) > 0 ? element(module.network_ddos_protection_plan.andpl_id, 0) : ""
    enable = true
  }
}

# ==============================================================================
# SUBNET  MODULES
# ==============================================================================

module "subnet" {
  source                                                = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/Subnet/"
  project_resource_group_name                           = var.project_resource_group_name
  subnet_name                                           = var.subnet_name
  subnet_virtual_network_name                           = length(module.virtual-network.avnet_name) > 0 ? element(module.virtual-network.avnet_name, 0) : ""
  subnet_address_prefix                                 = var.subnet_address_prefix
  delegations                                           = var.delegations
  subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies
  subnet_service_endpoints                              = var.subnet_service_endpoints
  resource_deploy                                       = var.resource_deploy
  resource_depends_on                                   = module.virtual-network
}
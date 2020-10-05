
# ==============================================================================
# DATA MODULE
# ==============================================================================
#Create network ddos protection plan service

module "network_ddos_protection_plan" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkDdosProtectionPlan/"
  project_resource_group_name = var.project_resource_group_name
  andpl_name                  = var.andpl_name
}

# ==============================================================================
# VIRTUAL NETWORK MODULE
# ==============================================================================


module "virtual-network" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetwork/"
  project_resource_group_name = var.project_resource_group_name
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  avnet_address_space         = var.avnet_address_space
  avnet_dns_servers           = var.avnet_dns_servers
  ddos_protection_plan = ({
    id     = module.network_ddos_protection_plan.andpl_id[0]
    enable = true
  })
  resource_deploy = var.resource_deploy
}
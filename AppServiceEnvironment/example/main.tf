data "azurerm_resource_group" "rg" {
  name                         = "RG-TOTAL-DV-WE-TG-TASNIMEDEV"
}


#Create network ddos protection plan service

module "network_ddos_protection_plan" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkDdosProtectionPlan/"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  andpl_name                = "andpl0tasnime"
}

#Create virtual network 
module "virtual-network" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetwork/"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  
  avnet_name                = "avnet0tasnime"
  avnet_address_space       = ["10.0.0.0/16"]
  avnet_dns_servers         = ["10.0.0.4", "10.0.0.5"]

  avnet_ddos_protection_plan = {
      id     = length(module.network_ddos_protection_plan.andpl_id) > 0 ? element(module.network_ddos_protection_plan.andpl_id,0): ""
      enable = true
  }


}

module "subnet" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/Subnet/"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  subnet_name                 = "testsubnet"
  #resource_group_name  = data.azurerm_resource_group.rg.name
  subnet_virtual_network_name     = length(module.virtual-network.avnet_name) > 0 ? element(module.virtual-network.avnet_name,0): ""
  subnet_address_prefix       = "10.0.1.0/24"


}
module "app-service-environment" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AppServiceEnvironment/"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  
  aase_name                     = "aase0tasnime"
  aase_subnet_id                = length(module.subnet.subnet_id) > 0 ? element(module.subnet.subnet_id,0) : "/subscriptions/47ea923d-bbfb-4cae-a53b-6ae79b0d836f/resourceGroups/RG-TOTAL-DV-WE-TG-TASNIMEDEV/providers/Microsoft.Network/virtualNetworks/test/subnets/test" 
  aase_pricing_tier             = "I2"
  aase_front_end_scale_factor   = 10

}

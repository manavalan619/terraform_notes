#Virtual Network Peering module
module "avnp" {
  source                            = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetworkPeering"
  project_resource_group_name       = var.project_resource_group_name
  avnet1_name                       = var.avnet1_name
  avnet2_name                       = var.avnet2_name
  avnp_name                         = var.avnp_name
  avnp_allow_virtual_network_access = var.avnp_allow_virtual_network_access
  avnp_allow_forwarded_traffic      = var.avnp_allow_forwarded_traffic
  avnp_allow_gateway_transit        = var.avnp_allow_gateway_transit
  avnp_use_remote_gateways          = var.avnp_use_remote_gateways
  resource_deploy                   = var.resource_deploy
}

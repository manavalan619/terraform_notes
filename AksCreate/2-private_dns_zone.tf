# ==============================================================================
# Private DNS Zone
# ==============================================================================
module "aks_vnet_private_dns_zone" {
  source                       = "../PrivateDnsZone/"
  resource_deploy              = var.aks_resource_deploy
  resource_index               = "aksvnet" // var.aks_vnet_private_dns_zone_resource_index // TODO : force static value = "aksvnet"
  project_name                 = var.project_name
  short_project_name           = var.short_project_name
  project_resource_group_name  = var.project_resource_group_name
  env_code                     = var.env_code
  private_dns_zone_name        = var.private_dns_zone_name
  pdz_virtual_network_id       = var.aks_resource_deploy ? module.vnet_aks.avnet_id[0] : ""
  resource_depends_on          = [module.vnet_aks]
}
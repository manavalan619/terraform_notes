# ==============================================================================
# App GW frontend Public IP
# ==============================================================================
module "appgw_frontend_public_ip" {
  source                       = "../PublicIp/" 
  resource_deploy              = var.aks_resource_deploy
  resource_index               = "appgw" 
  project_name                 = var.project_name
  short_project_name           = var.short_project_name
  project_resource_group_name  = var.project_resource_group_name
  env_code                     = var.env_code
  apip_sku                     = var.apip_sku                     // "Standard"
  apip_allocation_method       = var.apip_allocation_method       // "Static"
  apip_ip_version              = var.apip_ip_version              // "IPv4"
  apip_domain_name_label       = var.aks_resource_deploy ? local.apip_domain_name_label_target_name : ""
  apip_reverse_fqdn            = var.apip_reverse_fqdn
  # apip_public_ip_prefix_id     = var.aks_resource_deploy ? var.apip_public_ip_prefix_id : ""
  apip_zones                   = var.apip_zones
  apip_idle_timeout_in_minutes = var.apip_idle_timeout_in_minutes // 30
}

# ==============================================================================
# Creates Appplication Gateway
# ==============================================================================
module "appgw" {
  source                                               = "../ApplicationGateway/" 
  resource_deploy                                      = var.aks_resource_deploy
  resource_index                                       = "appgw"
  project_name                                         = var.project_name
  short_project_name                                   = var.short_project_name
  project_resource_group_name                          = var.project_resource_group_name
  env_code                                             = var.env_code

  appgw_sku_name                                       = var.appgw_sku_name
  appgw_sku_tier                                       = var.appgw_sku_tier

  #appgw_ssl_certificate
  appgw_ssl_certificate_name                           = var.appgw_ssl_certificate_name
  appgw_target_domain_name                             = var.appgw_target_domain_name
  # identity
  appgw_identity_ids                                   = var.aks_resource_deploy ? [module.appgw_user_assigned_identity.uai_id[0]] : [] //azurerm_user_assigned_identity.appgw_user_assigned_identity[0].id

  # gateway_ip_configuration
  appgw_gateway_ip_configuration_subnet_id             = var.aks_resource_deploy ? module.aks_appgw_subnet.subnet_id[0]  : ""

  # frontend_ip_configuration
  appgw_frontend_ip_configuration_public_ip_address_id = var.aks_resource_deploy ? module.appgw_frontend_public_ip.apip_id[0] : ""

  # backend_address_pool
  appgw_backend_address_pool_ip_addresses              = var.appgw_backend_address_pool_ip_addresses // private ip adress to choose in the CIDR range of the apim subnet

  # appgw_autoscale_configuration
  appgw_autoscale_configuration_min_capacity           = 2
  appgw_autoscale_configuration_max_capacity           = 10

  resource_depends_on = [module.vnet_aks,module.appgw_frontend_public_ip,module.appgw_user_assigned_identity]

}

// akv-tf-dv-ne-drillx
// akv-tf-at-ne-drillx
// akv-tf-hp-ne-drillx
// akv-tf-p-ne-drillx

# ====================================================================================
# Adds access policy Reader to kv-total-it-aksmgt for the AppGw UserAssigned Identity
# The AppGw UserAssigned Identity must have read access on wildcard certificate
# ====================================================================================
# module "add_access_policy_to_appgw_identity_on_project_akv" {
#   source                            = "../KeyVaultAccessPolicy/"
#   akv_access_policy_key_vault_id    = var.aks_resource_deploy ? data.azurerm_key_vault.akv_tf.id : ""
#   akv_access_policy_object_ids      = [module.appgw_user_assigned_identity.uai_client_id[0]]
#   akv_access_policy_security_level  = "Reader"
# }

# resource "azurerm_role_assignment" "set_reader_role_on_akv_for_appgw_identity" {
#   # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
#   # count = 1
#   count                = var.deploy_aks ? 1 : 0
#   scope                = // data.azurerm_resource_group.project_resource_group.id
#   role_definition_name = "Reader"
#   principal_id         = module.appgw_user_assigned_identity.uai_principal_id[0] // azurerm_user_assigned_identity.aks_user_assigned_identity[0].principal_id // var.aks_service_principal_object_id 
#   depends_on           = [module.appgw , module.appgw_user_assigned_identity] 
# }
# ======================================================
# Rbac assigment
# ======================================================
# module "role" {
#   source               = "../AssignAkvAccessPolicy/"
#   aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
#   role_scope_ids       = var.resource_deploy ? [for instance in azurerm_key_vault.akv : instance.id] : []
#   role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
#   resource_depends_on  = [azurerm_key_vault.akv]
# }
# # ==============================================================================
# # Assign "Network Contributor" Role to SP AKS on aks subnet
# # ==============================================================================
module "ra1" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? module.aks_kube_subnet.subnet_id[0] : ""
  role_definition_name = "Network Contributor"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = [module.vnet_aks, module.aks_kube_subnet]
}

# ==============================================================================
# Assign "Managed Identity Operator" Role to SP AKS on user assign identity
# (in case an aks user identity is create instead of a SP)
# Currently we use an SP AKS so we comment this part
# ==============================================================================
# module "ra2" {
#   resource_deploy      = var.aks_resource_deploy
#   source               = "../AssignRbacRoleWithId/" 
#   role_scope_id        = var.aks_resource_deploy ? module.aks_user_assigned_identity.uai_id[0] : ""
#   role_definition_name = "Managed Identity Operator"
#   role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
#   resource_depends_on  = [module.vnet_aks, module.aks_kube_subnet]
# }

# ==============================================================================
# Assign "Contributor" Role to SP AKS on app gateway
# ==============================================================================
module "ra3" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? module.appgw.appgw_id[0] : ""
  role_definition_name = "Contributor"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = [module.appgw]
}

# ==============================================================================
# Assign Reader Role to SP AKS on Project Resource Group
# ==============================================================================
module "ra4" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? data.azurerm_resource_group.project_resource_group.id : ""
  role_definition_name = "Reader"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = []
}

# ==============================================================================
# ACR : Assign "AcrPull" role to AKS SP so that the AKS SP can pull an image from ACR
# ==============================================================================
module "ra5" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? module.acr.acr_id[0] : ""
  role_definition_name = "AcrPull"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = [module.acr]
}

# ==============================================================================
# ACR : Assign "AcrPush" role to AKS SP so that the AKS SP can push an image from ACR
# ==============================================================================
module "ra6" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? module.acr.acr_id[0] : ""
  role_definition_name = "AcrPush"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = [module.acr]
}

# ==============================================================================
# ACR : Assign "Contributor" role to AKS SP on the private zone
# ==============================================================================
module "ra7" {
  resource_deploy      = var.aks_resource_deploy
  source               = "../AssignRbacRoleWithId/" 
  role_scope_id        = var.aks_resource_deploy ? module.aks_vnet_private_dns_zone.pdz_id[0] : ""
  role_definition_name = "Contributor"
  role_principal_id    = data.azurerm_key_vault_secret.aks-sp-internal-id.value
  resource_depends_on  = [module.aks_vnet_private_dns_zone]
}
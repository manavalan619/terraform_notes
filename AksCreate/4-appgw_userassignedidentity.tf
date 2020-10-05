# ==============================================================================
# App GW User Assigned Identity
# ==============================================================================
module "appgw_user_assigned_identity" {
  source                       = "../UserAssignedIdentity/"
  resource_deploy              = var.aks_resource_deploy
  resource_index               = "appgw" 
  project_name                 = var.project_name
  short_project_name           = var.short_project_name
  project_resource_group_name  = var.project_resource_group_name
  env_code                     = var.env_code
}

# resource "azurerm_role_assignment" "set_reader_role_on_akv_for_appgw_identity" {
#   # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
#   # count = 1
#   count                = var.deploy_aks ? 1 : 0
#   scope                = // data.azurerm_resource_group.project_resource_group.id
#   role_definition_name = "Reader"
#   principal_id         = module.appgw_user_assigned_identity.uai_principal_id[0] // azurerm_user_assigned_identity.aks_user_assigned_identity[0].principal_id // var.aks_service_principal_object_id 
#   depends_on           = [module.appgw , module.appgw_user_assigned_identity] 
# }
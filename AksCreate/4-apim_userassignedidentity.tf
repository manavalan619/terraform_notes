# ==============================================================================
# App GW User Assigned Identity
# ==============================================================================

// to be uncommented into the target 
module "apim_user_assigned_identity" {
  source                       = "../UserAssignedIdentity/"
  resource_deploy              = var.aks_resource_deploy
  resource_index               = "apim" 
  project_name                 = var.project_name
  short_project_name           = var.short_project_name
  project_resource_group_name  = var.project_resource_group_name
  env_code                     = var.env_code
}
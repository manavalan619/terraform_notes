# ==============================================================================
# Creates Azure Container Registry
# ==============================================================================
module "acr" {
    source                      = "../AzureContainerRegistry/" 
    resource_deploy             = var.aks_resource_deploy
    project_name                = var.project_name
    short_project_name          = var.short_project_name
    project_resource_group_name = var.project_resource_group_name
    env_code                    = var.env_code

    // acr core variables
    acr_sku                     = var.acr_sku
    acr_admin_enabled           = var.acr_admin_enabled
    # acr_ip_rule                 = var.acr_ip_rule
    # acr_vnet                    = var.acr_vnet
   
}
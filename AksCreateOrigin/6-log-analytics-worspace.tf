# Manage AKS Monitoring integration

# ========================================================================================
# Creates a Project Log Analytics Worskpace (formally Operational Insights)
# ========================================================================================
module "aks_law" {
  source                      = "../LogAnalyticsWorkspace/"
  
  project_resource_group_name = data.azurerm_resource_group.project_resource_group.name
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = "WE"

  law_name                    = local.law_target_name
  law_sku_name                = var.law_sku_name
  law_retention_in_days       = var.law_retention_in_days
}

# ========================================================================================
# Creates a Project Log Analytics Solution in the Log Analytics workspace
# ========================================================================================
module "aks_las" {
  source                      = "../LogAnalyticsSolution/"
  project_resource_group_name = data.azurerm_resource_group.project_resource_group.name
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = "WE"

  las_workspace_resource_id   = module.aks_law.law_id
  las_workspace_name          = module.aks_law.law_name
  las_solution_name           = "ContainerInsights"
  las_plan_publisher_name     = "Microsoft"
  las_plan_product_name       = "OMSGallery/ContainerInsights"
}
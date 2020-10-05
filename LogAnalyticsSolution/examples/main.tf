# Create ressources group
module "rg" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/RessourceGroup/"
  project_resource_group_name = var.project_resource_group_name
  location                    = var.location 
  tags                        = var.tags
}

# Create Log Analytics Workspace
module "law" {
  source = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/LogAnalyticsWorspace/"
  project_resource_group_name = module.rg.project_resource_group_name
  law_name                    = var.law_name
  law_sku_name                = var.law_sku_name
  law_retention_in_days       = var.law_retention_in_days
}

# Create Log Analytics Solution
module "las" {
  source = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/LogAnalyticsSolution/"
  project_resource_group_name = module.rg.project_resource_group_name
  las_workspace_resource_id   = module.LogAnalyticsWorspace.law_id
  las_workspace_name          = module.LogAnalyticsWorspace.law_name
  las_solution_name           = var.las_solution_name
  las_plan_publisher_name     = var.las_plan_publisher_name
  las_plan_product_name       = var.las_plan_product_name
}

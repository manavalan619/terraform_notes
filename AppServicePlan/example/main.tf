#Creates app service plan
module "aasp" {
  source                        = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AppServicePlan/"
  project_resource_group_name   = var.project_resource_group_name
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  aasp_sku_tier                 = var.aasp_sku_tier
  aasp_sku_size                 = var.aasp_sku_size
  aasp_sku_capacity             = var.aasp_sku_capacity
  aasp_kind                     = var.aasp_kind
  aasp_max_elastic_worker_count = var.aasp_max_elastic_worker_count
  resource_deploy               = var.resource_deploy
}
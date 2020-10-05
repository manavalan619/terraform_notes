# Create ressources group
module "rg" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/TF-ASA-DEVOPS/_git/TF-ASA-DEVOPS//infra/Modules/RessourceGroup"
  project_resource_group_name = var.project_resource_group_name
  location                    = var.location
  tags                        = var.tags
}
# Create Storage Account
module "asa" {
  source                        = "git::https://___GitToken___@dev.azure.com/TotalDataLake/TF-ASA-DEVOPS/_git/TF-ASA-DEVOPS//infra/Modules/StorageAccount"
  project_resource_group_name   = module.rg.project_resource_group_name
  asa_name                      = var.asa_name
  asa_kind                      = var.asa_kind
  asa_enable_https_traffic_only = var.asa_enable_https_traffic_only
}
# Create App Service plan
module "aasp" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AppServicePlan"
  project_resource_group_name = module.rg.project_resource_group_name
  aasp_sku_tier               = var.aasp_sku_tier
  aasp_name                   = var.aasp_name
  aasp_sku_size               = var.aasp_sku_size
}

# Create func app
module "afa" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/FunctionApp"
  project_resource_group_name = module.rg.project_resource_group_name
  afa_aasp_id                 = module.aasp.aasp_id[0]
  afa_asa_connection_string   = module.asa.asa_connection_string[0]
  afa_app_settings            = var.afa_app_settings
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
}
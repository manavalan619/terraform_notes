# ==============================================================================
# DATA  MODULES
# ==============================================================================
# Create stoarge account

module "asa" {
  source                        = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageAccount/"
  asa_name                      = var.asa_name
  project_resource_group_name   = var.project_resource_group_name
  asa_kind                      = var.asa_kind
  resource_deploy               = var.resource_deploy
  asa_enable_https_traffic_only = var.asa_enable_https_traffic_only
}

# Create Storage Container
module "ascn" {
  source                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageContainer/"
  project_resource_group_name  = var.project_resource_group_name
  resource_deploy              = var.resource_deploy
  azurerm_storage_account_name = module.asa.asa_name[0]
  ascn_name                    = var.ascn_name
  ascn_container_access_type   = var.ascn_container_access_type
}

# Create Iot Hub
module "aioth" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/IotHub/"
  project_resource_group_name = var.project_resource_group_name
  aioth_sku_name              = var.aioth_sku_name
  aioth_sku_capacity          = var.aioth_sku_capacity
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  resource_deploy             = var.resource_deploy
}

# Create IotHub End Point
module "aiothepsc" {
  source                               = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/IotHubEndPoint/"
  project_resource_group_name          = var.project_resource_group_name
  asa_name                             = module.asa.asa_name[0]
  ascn_name                            = module.ascn.ascn_name[0]
  aioth_name                           = module.aioth.aioth_name[0]
  aiothepsc_batch_frequency_in_seconds = var.aiothepsc_batch_frequency_in_seconds
  aiothepsc_max_chunk_size_in_bytes    = var.aiothepsc_max_chunk_size_in_bytes
  aiothepsc_encoding                   = var.aiothepsc_encoding
  aiothepsc_file_name_format           = var.aiothepsc_file_name_format
  project_name                         = var.project_name
  short_project_name                   = var.short_project_name
  env_code                             = var.env_code
  resource_index                       = var.resource_index
  resource_deploy                      = var.resource_deploy
}

# ==============================================================================
# IOTHUB FALL BACKROUTE  MODULES
# ==============================================================================

module "aiothfbr" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/IotHubFallBackRoute/"
  project_resource_group_name = var.project_resource_group_name
  asa_name                    = module.asa.asa_name[0]
  ascn_name                   = module.ascn.ascn_name[0]
  aioth_name                  = module.aioth.aioth_name[0]
  aiothfbr_endpoint_names     = module.aiothepsc.aiothepsc_name[0]
  resource_deploy             = var.resource_deploy
}

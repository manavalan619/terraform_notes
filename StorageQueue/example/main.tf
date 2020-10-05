# ==============================================================================
# DATA  MODULES
# ==============================================================================
# Create stoarge account

module "asa" {
  source                        = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageAccount"
  project_resource_group_name   = var.project_resource_group_name
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  asa_kind                      = var.asa_kind
  asa_account_tier              = var.asa_account_tier
  asa_enable_https_traffic_only = var.asa_enable_https_traffic_only
  resource_deploy               = var.resource_deploy
  asa_account_replication_type  = var.asa_account_replication_type
  asa_access_tier               = var.asa_access_tier
  asa_is_hns_enabled            = var.asa_is_hns_enabled
}


# ==============================================================================
# ASQ  MODULES
# ==============================================================================

module "asq" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageQueue"
  project_resource_group_name = var.project_resource_group_name
  asa_name                    = length(module.asa.asa_name) > 0 ? element(module.asa.asa_name, 0) : ""
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_deploy             = var.resource_deploy
  resource_index              = var.resource_index
}

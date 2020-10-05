# Create Key Vault
module "akv" {
  source                              = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVault/"
  project_resource_group_name         = var.project_resource_group_name
  short_project_name                  = var.short_project_name
  location_code                       = var.location_code
  akv_sku_name                        = var.akv_sku_name
  project_name                        = var.project_name
  akv_enabled_for_deployment          = var.akv_enabled_for_deployment
  akv_enabled_for_template_deployment = var.akv_enabled_for_template_deployment
  akv_soft_delete_enabled             = var.akv_soft_delete_enabled
  akv_purge_protection_enabled        = var.akv_purge_protection_enabled
  env_code                            = var.env_code
  resource_deploy                     = var.resource_deploy
}

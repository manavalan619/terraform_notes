# Create Key Vault
module "akv" {
  source                              = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVault/"
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
# Create Key Vault Access Policy
module "akv_access_policy" {
  source                           = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVaultAccessPolicy/"
  akv_access_policy_key_vault_id   = length(module.akv.akv_id) > 0 ? element(module.akv.akv_id, 0) : ""
  akv_access_policy_object_ids     = var.akv_access_policy_object_ids
  akv_access_policy_security_level = var.akv_access_policy_security_level
  resource_depends_on              = var.resource_depends_on
}

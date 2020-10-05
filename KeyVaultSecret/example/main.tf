# Create Key Vault Secret
module "akv_secret" {
  source                  = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KeyVaultSecret/"
  akv_key_vault_id        = var.akv_key_vault_id
  akv_secret_name         = var.akv_secret_name
  akv_secret_value        = var.akv_secret_value
  akv_secret_content_type = var.akv_secret_content_type
}
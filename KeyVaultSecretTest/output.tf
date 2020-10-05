# ==============================================================================
# Key Vault Secret - Output variables
# ==============================================================================
output "akv_secret_id" {
    value       = [for instance in azurerm_key_vault_secret.akv_secret : instance.id]
    description = "Key Vault Secret ID."
}
output "akv_secret_version" {
    value       = [for instance in azurerm_key_vault_secret.akv_secret : instance.version]
    description = "Key Vault Secret Version."
}
# ==============================================================================
# Azure KeyVaultSimple - Output variables
# ==============================================================================
output "akv_id" {
  value       = [for instance in azurerm_key_vault.akv : instance.id]
  description = "Key Vault ID."
}
output "akv_vault_uri" {
  value       = [for instance in azurerm_key_vault.akv : instance.vault_uri]
  description = "Key Vault URI."
}
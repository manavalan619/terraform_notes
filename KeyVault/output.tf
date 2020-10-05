# ==============================================================================
# Azure KeyVault Output variables
# ==============================================================================
output "akv_id" {
  value       = [for instance in azurerm_key_vault.akv : instance.id]
  description = "Key Vaullt ID."
}
output "akv_vault_uri" {
  value       = [for instance in azurerm_key_vault.akv : instance.vault_uri]
  description = "Key Vaullt URI."
}

# ==============================================================================
# Key Vault Access Policy - Output variables
# ==============================================================================
# output "akv_access_policy_id" {
#     value       = module.akv_access_policy.akv_access_policy_id
#     description = "Key Vault Access Policy ID."
# }

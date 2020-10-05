# ==============================================================================
# Key Vault Access Policy - Output variables
# ==============================================================================
output "akv_id" {
  value       = [for instance in azurerm_key_vault_access_policy.akv_access_policy : instance.key_vault_id]
  description = "Key Vault ID."
}

output "akv_access_policy_id" {
  value       = [for instance in azurerm_key_vault_access_policy.akv_access_policy : instance.id]
  description = "Key Vault Access Policy ID."
}

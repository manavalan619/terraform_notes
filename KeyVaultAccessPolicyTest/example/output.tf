# ==============================================================================
# Key Vault Access Policy Output variables
# ==============================================================================
output "akv_id" {
  value       = module.akv.akv_id
  description = "Key Vault ID."
}
output "akv_vault_uri" {
  value       = module.akv.akv_vault_uri
  description = "Key Vault Access Policy ID."
}

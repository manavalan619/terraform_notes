# ==============================================================================
# Azure KeyVault Output variables
# ==============================================================================
output "akv_id" {
  value       = module.akv.akv_id
  description = "Key Vaullt ID."
}
output "akv_vault_uri" {
  value       = module.akv.akv_vault_uri
  description = "Key Vaullt URI."
}
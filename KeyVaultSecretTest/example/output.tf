# ==============================================================================
# Key Vault Secret - Output variables
# ==============================================================================
output "akv_secret_id" {
  value       = module.akv_secret.akv_secret_id
  description = "Key Vault Secret ID."
}
output "akv_secret_version" {
  value       = module.akv_secret.akv_secret_version
  description = "Key Vault Secret Version."
}
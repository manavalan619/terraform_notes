# ==============================================================================
# Azure Storage Blob Output variables
# ==============================================================================
output "asb_id" {
  value       = module.asb.asb_id
  description = "The ID of the Storage Blob."
}
output "asb_url" {
  value       = module.asb.asb_url
  description = "The URL of the Storage Blob"
}

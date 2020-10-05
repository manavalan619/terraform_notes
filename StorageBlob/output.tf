# ==============================================================================
# Azure Storage Blob Output variables
# ==============================================================================
output "asb_id" {
  value       = [for instance in azurerm_storage_blob.asb : instance.id]
  description = "The ID of the Storage Blob."
}
output "asb_url" {
  value       = [for instance in azurerm_storage_blob.asb : instance.url]
  description = "The URL of the Storage Blob"
}




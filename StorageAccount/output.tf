# ==============================================================================
# Storage Account - Output variables
# ==============================================================================
output "asa_name" {
  value       = [for instance in azurerm_storage_account.asa : instance.name]
  description = "The Storage Account Name."
}
output "asa_id" {
  value       = [for instance in azurerm_storage_account.asa : instance.id]
  description = "The Storage Account ID."
}
output "asa_connection_string" {
  value       = [for instance in azurerm_storage_account.asa : instance.primary_connection_string]
  description = "The connection string associated with the primary location."
}
output "asa_primary_blob_connection_string" {
  value       = [for instance in azurerm_storage_account.asa : instance.primary_blob_connection_string]
  description = "The connection string associated with the primary blob location."
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
//  Note : If there's a Write Lock on the Storage Account, or the account doesn't have permission then these fields will have an empty value
# output "asa_primary_location" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_location]
#     description = "The primary location of the storage account."
# }
# output "asa_secondary_location" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_location]
#     description = "The secondary location of the storage account."
# }
# output "asa_primary_blob_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_blob_endpoint]
#     description = "The endpoint URL for blob storage in the primary location."
# }
# output "asa_primary_blob_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_blob_host]
#     description = "The hostname with port if applicable for blob storage in the primary location."
# }
# output "asa_secondary_blob_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_blob_endpoint]
#     description = "The endpoint URL for blob storage in the secondary location."
# }
# output "asa_secondary_blob_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_blob_host]
#     description = "The hostname with port if applicable for blob storage in the secondary location."
# }
# output "asa_primary_queue_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_queue_endpoint]
#     description = "The endpoint URL for queue storage in the primary location."
# }
# output "asa_primary_queue_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_queue_host]
#     description = "The hostname with port if applicable for queue storage in the primary location."
# }
# output "asa_secondary_queue_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_queue_endpoint]
#     description = "The endpoint URL for queue storage in the secondary location."
# }
# output "asa_secondary_queue_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_queue_host]
#     description = "The hostname with port if applicable for queue storage in the secondary location."
# }
# output "asa_primary_table_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_table_endpoint]
#     description = "The endpoint URL for table storage in the primary location."
# }
# output "asa_primary_table_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_table_host]
#     description = "The hostname with port if applicable for table storage in the primary location."
# }
# output "asa_secondary_table_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_table_endpoint]
#     description = "The endpoint URL for table storage in the secondary location."
# }
# output "asa_secondary_table_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_table_host]
#     description = "The hostname with port if applicable for table storage in the secondary location."
# }
# output "asa_primary_file_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_file_endpoint]
#     description = "The endpoint URL for file storage in the primary location."
# }
# output "asa_primary_file_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_file_host]
#     description = "The hostname with port if applicable for file storage in the primary location."
# }
# output "asa_secondary_file_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_file_endpoint]
#     description = "The endpoint URL for file storage in the secondary location."
# }
# output "asa_secondary_file_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_file_host]
#     description = "The hostname with port if applicable for file storage in the secondary location."
# }
# output "asa_primary_dfs_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_dfs_endpoint]
#     description = "The endpoint URL for DFS storage in the primary location."
# }
# output "asa_primary_dfs_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_dfs_host]
#     description = "The hostname with port if applicable for DFS storage in the primary location."
# }
# output "asa_secondary_dfs_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_dfs_endpoint]
#     description = "The endpoint URL for DFS storage in the secondary location."
# }
# output "asa_secondary_dfs_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_dfs_host]
#     description = "The hostname with port if applicable for DFS storage in the secondary location."
# }
# output "asa_primary_web_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_web_endpoint]
#     description = "The endpoint URL for web storage in the primary location."
# }
# output "asa_primary_web_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_web_host]
#     description = "The hostname with port if applicable for web storage in the primary location."
# }
# output "asa_secondary_web_endpoint" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_web_endpoint]
#     description = "The endpoint URL for web storage in the secondary location."
# }
# output "asa_secondary_web_host" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_web_host]
#     description = "The hostname with port if applicable for web storage in the secondary location."
# }
# output "asa_primary_access_key" {
#     value       = [for instance in azurerm_storage_account.asa : instance.primary_access_key]
#     description = "The primary access key for the storage account."
# }
# output "asa_secondary_access_key {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_access_key]
#     description = ""
# }
# output "asa_secondary_connection_string" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_connection_string]
#     description = "The connection string associated with the secondary location."
# }
# output "asa_secondary_blob_connection_string" {
#     value       = [for instance in azurerm_storage_account.asa : instance.secondary_blob_connection_string]
#     description = "The connection string associated with the secondary blob location."
# }

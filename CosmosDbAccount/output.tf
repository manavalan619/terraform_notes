# ==============================================================================
# CosmosDb Account - Output variables
# ==============================================================================
output "acdb_id" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.id]
    description = "CosmosDb Account ID."
}
output "acdb_endpoint" {
  value       = [for instance in azurerm_cosmosdb_account.acdb : instance.endpoint]
  description = "The endpoint used to connect to the CosmosDB account."
}
output "acdb_read_endpoints" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.read_endpoints]
    description = "A list of read endpoints available for this CosmosDB account."
}
output "acdb_write_endpoints" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.write_endpoints]
    description = "A list of write endpoints available for this CosmosDB account."
}
output "acdb_primary_master_key" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.primary_master_key]
    description = "The Primary master key for the CosmosDB Account."
}
output "acdb_secondary_master_key" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.secondary_master_key]
    description = "The Secondary master key for the CosmosDB Account."
}
output "acdb_primary_readonly_master_key" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.primary_readonly_master_key]
    description = "The Primary read-only master Key for the CosmosDB Account."
}
output "acdb_secondary_readonly_master_key" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.secondary_readonly_master_key]
    description = "The Secondary read-only master Key for the CosmosDB Account."
}
output "acdb_connection_strings" {
    value       = [for instance in azurerm_cosmosdb_account.acdb : instance.connection_strings]
    description = "A list of connection strings available for this CosmosDB account. If the kind is GlobalDocumentDB, this will be empty.."
}
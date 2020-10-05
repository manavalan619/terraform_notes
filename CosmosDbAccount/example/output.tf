# ==============================================================================
# CosmosDb Output variables
# ==============================================================================

output "acdb_id" {
  value       = module.acdb.acdb_id
  description = "CosmosDb Account ID."
}
output "acdb_endpoint" {
  value       = module.acdb.acdb_endpoint
  description = "The endpoint used to connect to the CosmosDB account."
}
output "acdb_read_endpoints" {
  value       = module.acdb.acdb_read_endpoints
  description = "A list of read endpoints available for this CosmosDB account."
}
output "acdb_write_endpoints" {
  value       = module.acdb.acdb_write_endpoints
  description = "A list of write endpoints available for this CosmosDB account."
}
output "acdb_primary_master_key" {
  value       = module.acdb.acdb_primary_master_key
  description = "The Primary master key for the CosmosDB Account."
}
output "acdb_secondary_master_key" {
  value       = module.acdb.acdb_secondary_master_key
  description = "The Secondary master key for the CosmosDB Account."
}
output "acdb_primary_readonly_master_key" {
  value       = module.acdb.acdb_primary_readonly_master_key
  description = "The Primary read-only master Key for the CosmosDB Account."
}
output "acdb_secondary_readonly_master_key" {
  value       = module.acdb.acdb_secondary_readonly_master_key
  description = "The Secondary read-only master Key for the CosmosDB Account."
}
output "acdb_connection_strings" {
  value       = module.acdb.acdb_connection_strings
  description = "A list of connection strings available for this CosmosDB account. If the kind is GlobalDocumentDB, this will be empty.."
}

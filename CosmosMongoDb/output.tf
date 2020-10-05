# ==============================================================================
# CosmosDb Mongo Database - Output variables
# ==============================================================================
output "acdb_mongo_db_id" {
  value       = [for instance in azurerm_cosmosdb_mongo_database.acdb_mongo_db : instance.id]
  description = "Cosmos DB Mongo Database ID."
}
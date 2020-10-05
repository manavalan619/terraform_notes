# ==============================================================================
# CosmosDb Mongo Collection - Output variables
# ==============================================================================
output "acdb_mongo_collection_id" {
  value       = [for instance in azurerm_cosmosdb_mongo_collection.acdb_mongo_collection : instance.id]
  description = "Cosmos DB Mongo Collection ID."
}
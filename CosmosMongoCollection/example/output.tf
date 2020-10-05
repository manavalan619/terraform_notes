# ==============================================================================
# CosmosDb Mongo Collection Output variables
# ==============================================================================

# The Cosmos DB Mongo Collection.
output "acdb_collection_id" {
  value = module.acdb_mongo_collection.acdb_mongo_collection_id
  description = "Cosmos DB Mongo Collection ID."
}

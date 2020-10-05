# ==============================================================================
# CosmosDb Mongo Database - Output variables
# ==============================================================================
output "acdb_mongo_db_id" {
  value       = module.acdb_mongo_db.acdb_mongo_db_id
  description = "Cosmos DB Mongo Database ID."
}

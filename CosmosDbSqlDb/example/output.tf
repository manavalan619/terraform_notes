# ==============================================================================
# CosmosDb SQL Database Output variables
# ==============================================================================

# The CosmosDB SQL Database Id.
output "acdb_database_id" {
  value = module.acdb_database.acdb_cosmosdb_sqldb_id
}

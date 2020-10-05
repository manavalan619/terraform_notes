# ==============================================================================
# CosmosDb SQL Database - Output variables
# ==============================================================================
output "acdb_cosmosdb_sqldb_id" {
  value       = [for instance in azurerm_cosmosdb_sql_database.acdb_cosmosdb_sqldb : instance.id]
  description = "CosmosDB SQL Database ID."
}

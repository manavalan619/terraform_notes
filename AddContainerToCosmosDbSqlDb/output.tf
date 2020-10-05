# ==============================================================================
# SQL Container (in a CosmosDB Account/SQL DB)  - Output variables
# ==============================================================================
output "acsc_id" {
  value       = [for instance in azurerm_cosmosdb_sql_container.acsc : instance.id]
  description = "The ID of the CosmosDB SQL Container created in a CosmosDB SQL Database."
}

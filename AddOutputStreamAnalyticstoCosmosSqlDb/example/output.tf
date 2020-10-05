# ==============================================================================
# ARM Deployment - Ouput Variables
# ==============================================================================
output "sta_output_CosmosdbSql_id" {
  value       = module.darm.sta_output_CosmosdbSql_id
  description = "The ID of the Stream Analytics Cosmos DB Sql output."
}
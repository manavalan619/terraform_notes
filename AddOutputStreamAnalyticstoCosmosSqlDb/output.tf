# ==============================================================================
# ARM Deployment - Ouput Variables
# ==============================================================================
output "sta_output_CosmosdbSql_id" {
  value       = [for instance in azurerm_template_deployment.darm : instance.outputs["sta_output_CosmosdbSql_id"]]
  description = "The ID of the Stream Analytics Cosmos DB Sql output."
}
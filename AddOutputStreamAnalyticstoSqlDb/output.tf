# ==============================================================================
# Stream Analytics Input Eventhub - Output variables
# ==============================================================================
output "sta_outputsqldb_id" {
  value       = [for instance in azurerm_stream_analytics_output_mssql.sta_outputsqldb : instance.id]
  description = "The ID of the Stream Analytics Output Microsoft SQL Server Database."
}
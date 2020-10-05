# ==============================================================================
# Stream Analytics Input Eventhub - Output variables
# ==============================================================================
output "sta_inputeventhub_id" {
  value       = [for instance in azurerm_stream_analytics_stream_input_eventhub.sta_inputeventhub : instance.id]
  description = "The ID of the Stream Analytics Stream Input EventHub."
}
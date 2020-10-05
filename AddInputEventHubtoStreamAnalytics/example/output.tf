# ==============================================================================
# Stream Analytics Stream Input EventHub Output variables
# ==============================================================================

output "sta_id" {
  value       = module.sta.sta_id
  description = "The ID of the Stream Analytics Job"
}

output "sta_inputeventhub_id" {
  value       = module.sta_inputeventhub.sta_inputeventhub_id
  description = "The ID of the Stream Analytics Stream Input EventHub."
}
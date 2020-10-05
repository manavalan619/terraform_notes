# ==============================================================================
# Stream Analytics Output variables
# ==============================================================================
output "sta_id" {
  value       = [for instance in azurerm_stream_analytics_job.sta : instance.id]
  description = "The ID of the Stream Analytics Job."
}
output "sta_job_id" {
  value       = [for instance in azurerm_stream_analytics_job.sta : instance.job_id]
  description = "The Job ID assigned by the Stream Analytics Job."
}

output "sta_job_name" {
  value       = [for instance in azurerm_stream_analytics_job.sta : instance.name]
  description = "The Job ID assigned by the Stream Analytics Job."
}
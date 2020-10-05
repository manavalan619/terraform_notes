# ==============================================================================
# Stream Analytics Output variables
# ==============================================================================
output "sta_job_id" {
  value       = [for instance in azurerm_template_deployment.sta_with_managed_identity : instance.outputs["stream_analytics_job_id"]]
  description = "The ID of the Stream Analytics Job."
}
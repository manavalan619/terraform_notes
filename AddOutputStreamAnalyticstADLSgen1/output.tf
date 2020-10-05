# ==============================================================================
# Stream Analytics ADLS output Output variables
# ==============================================================================
output "sta_adls_output_id" {
  value       = [for instance in azurerm_template_deployment.sta_adls_output : instance.outputs["sta_output_adls_id"]]
  description = "The ID of the Stream Analytics ADLS output."
}

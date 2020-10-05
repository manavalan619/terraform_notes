# ==============================================================================
# Stream Analytics ADLS output Output variables
# ==============================================================================
output "sta_adls_output_id" {
  value       = module.sta_adls_output.sta_adls_output_id
  description = "The ID of the Stream Analytics ADLS output."
}

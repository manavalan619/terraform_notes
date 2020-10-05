# ==============================================================================
# LogAnalyticsSolution Output variables
# ==============================================================================
output "las_id" {
  value       = azurerm_log_analytics_solution.las.id
  description = "The LogAnalyticsSolution ID."
}
output "las_name" {
  value       = azurerm_log_analytics_solution.las.solution_name
  description = "The LogAnalyticsSolution Name."
}
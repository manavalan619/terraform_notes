# ==============================================================================
# Log Analytics Worskpace - Output variables
# ==============================================================================
output "law_id" {
  value       = azurerm_log_analytics_workspace.law.id
  description = "The Log Analytics Workspace ID."
}
output "law_name" {
  value       = azurerm_log_analytics_workspace.law.name
  description = "The Log Analytics Workspace Name."
} 
output "law_portal_url" {
  value       = azurerm_log_analytics_workspace.law.portal_url
  description = "The Portal URL for the Log Analytics Workspace."
}
output "law_primary_shared_key" {
  value       = azurerm_log_analytics_workspace.law.primary_shared_key
  description = "The Primary shared key for the Log Analytics Workspace."
  sensitive   = true
}
output "law_secondary_shared_key" {
  value       = azurerm_log_analytics_workspace.law.secondary_shared_key
  description = "The Secondary shared key for the Log Analytics Workspace."
  sensitive   = true
}
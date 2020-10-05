# ==============================================================================
# LogAnalyticsWorkspace Output variables
# ==============================================================================
# The Log Analytics Workspace ID
output "law_id" {
  value = azurerm_log_analytics_workspace.law.id
}

# The Log Analytics Workspace Name
output "law_name" {
  value = azurerm_log_analytics_workspace.law.name
}

#  The Portal URL for the Log Analytics Workspace
output "law_portal_url" {
  value = azurerm_log_analytics_workspace.law.law_portal_url
}

#  The Primary shared key for the Log Analytics Workspace
output "law_primary_shared_key" {
  value = azurerm_log_analytics_workspace.law.law_primary_shared_key
}

# The Secondary shared key for the Log Analytics Workspace
output "secondary_shared_key" {
  value = azurerm_log_analytics_workspace.law.secondary_shared_key
}
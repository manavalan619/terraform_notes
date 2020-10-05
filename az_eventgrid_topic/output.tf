# ==============================================================================
# Event Grid Topic - Output variables
# ==============================================================================

output "aegt_name" {
  value       = azurerm_eventgrid_topic.aegt[0].name
  description = "The EventGrid Topic Name."
}

output "aegt_id" {
  value       = azurerm_eventgrid_topic.aegt[0].id
  description = "The EventGrid Topic ID."
}

output "aegt_primary_access_key" {
  value       = azurerm_eventgrid_topic.aegt[0].primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Topic."
}

output "aegt_secondary_access_key" {
  value       = azurerm_eventgrid_topic.aegt[0].secondary_access_key
  description = "The Secondary Shared Access Key associated with the EventGrid Topic."
}

output "aegt_endpoint" {
  value       = azurerm_eventgrid_topic.aegt[0].endpoint
  description = "The Endpoint associated with the EventGrid Topic."
}

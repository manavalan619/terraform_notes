# ==============================================================================
# Event Grid Domain - Output variables
# ==============================================================================

output "aegd_name" {
  value       = azurerm_eventgrid_domain.aegd[0].name
  description = "The Name of the EventGrid Domain."
}

output "aegd_id" {
  value       = azurerm_eventgrid_domain.aegd[0].id
  description = "The ID of the EventGrid Domain."
}

output "aegd_primary_access_key" {
  value       = azurerm_eventgrid_domain.aegd[0].primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Domain."
}

output "aegd_secondary_access_key" {
  value       = azurerm_eventgrid_domain.aegd[0].secondary_access_key
  description = "The Secondary Shared Access Key associated with the EventGrid Domain."
}

output "aegd_endpoint" {
  value       = azurerm_eventgrid_domain.aegd[0].endpoint
  description = "The Endpoint associated with the EventGrid Domain."
}

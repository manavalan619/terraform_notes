# ==============================================================================
# EventGrid Event Subscription - Output variables
# ==============================================================================

output "aeges_id" {
  value       = [for instance in azurerm_eventgrid_event_subscription.aeges : instance.id]
  description = "The ID of the EventGrid Event Subscription."
}

output "aeges_name" {
  value       = [for instance in azurerm_eventgrid_event_subscription.aeges : instance.name]
  description = "The Name of the EventGrid Event Subscription."
}
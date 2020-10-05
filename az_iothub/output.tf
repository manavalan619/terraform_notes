# ==============================================================================
# IotHub Output variables
# ==============================================================================
output "ioth_id" {
  value       = azurerm_iothub.ioth[0].id
  description = "The ID of the IoTHub."
}

output "ioth_name" {
  value       = azurerm_iothub.ioth[0].name
  description = "The Name of the IoTHub."
}

output "ioth_event_hub_events_endpoint" {
  value       = azurerm_iothub.ioth[0].event_hub_events_endpoint
  description = "The EventHub compatible path for events data"
}

output "ioth_event_hub_events_path" {
  value       = azurerm_iothub.ioth[0].event_hub_events_path
  description = "The EventHub compatible path for events data."
}

output "ioth_event_hub_operations_endpoint" {
  value       = azurerm_iothub.ioth[0].event_hub_operations_endpoint
  description = "The EventHub compatible endpoint for operational data."
}

output "ioth_event_hub_operations_path" {
  value       = azurerm_iothub.ioth[0].event_hub_operations_path
  description = "The EventHub compatible path for operational data."
}

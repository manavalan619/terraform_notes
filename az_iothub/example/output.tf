# ==============================================================================
# IotHub Output variables
# ==============================================================================

output "ioth_id" {
  value       = module.ioth.ioth_id
  description = "The Name of the IoTHub."
}

output "ioth_name" {
  value       = module.ioth.ioth_name
  description = "The Name of the IoTHub."
}

output "ioth_event_hub_events_endpoint" {
  value       = module.ioth.ioth_event_hub_events_endpoint
  description = "The EventHub compatible path for events data"
}

output "ioth_event_hub_events_path" {
  value       = module.ioth.ioth_event_hub_events_path
  description = "The EventHub compatible path for events data."
}

output "ioth_event_hub_operations_endpoint" {
  value       = module.ioth.ioth_event_hub_operations_endpoint
  description = "The EventHub compatible endpoint for operational data."
}

output "ioth_event_hub_operations_path" {
  value       = module.ioth.ioth_event_hub_operations_path
  description = "The EventHub compatible path for operational data."
}

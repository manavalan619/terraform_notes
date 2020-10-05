# ==============================================================================
# IotHub End Point - Output variables
# ==============================================================================

output "aiothepsc_name" {
  value       = [for instance in azurerm_iothub_endpoint_storage_container.aiothepsc : instance.name]
  description = "The Name of the IotHub Storage Container Endpoint."
}

output "aiothepsc_id" {
  value       = [for instance in azurerm_iothub_endpoint_storage_container.aiothepsc : instance.id]
  description = "The ID of the IoTHub Storage Container Endpoint."
}
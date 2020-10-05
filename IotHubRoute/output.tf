output "aiothr_name" {
  value       = [for instance in azurerm_iothub_route.aiothr : instance.name]
  description = "The Name of the Iot Hub Route."
}

output "aiothr_id" {
  value       = [for instance in azurerm_iothub_route.aiothr : instance.id]
  description = "The ID of the IoTHub Route."
}
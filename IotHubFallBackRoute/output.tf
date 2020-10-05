# ==============================================================================
# IoTHub Fallback Route - Output variables
# ==============================================================================

output "aiothfbr_id" {
  value       = [for instance in azurerm_iothub_fallback_route.aiothfbr : instance.id]
  description = "The ID of the IoTHub Fallback Route."
}
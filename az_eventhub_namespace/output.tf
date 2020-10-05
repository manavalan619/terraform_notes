# ==============================================================================
# Azure Event Hub Namespace Variables - Output variables
# ==============================================================================
output "aehn_id" {
  value       = azurerm_eventhub_namespace.aehn[0].id
  description = "Event Hub Namespace ID."
}

output "aehn_name" {
  value       = azurerm_eventhub_namespace.aehn[0].name
  description = "Event Hub Namespace Name."
}
output "aehn_default_primary_connection_string" {
  value       = azurerm_eventhub_namespace.aehn[0].default_primary_connection_string
  description = "The primary connection string for the authorization rule RootManageSharedAccessKey."
}
output "aehn_default_secondary_connection_string" {
  value       = azurerm_eventhub_namespace.aehn[0].default_secondary_connection_string
  description = "The secondary connection string for the authorization rule RootManageSharedAccessKey."
}
output "aehn_default_primary_key" {
  value       = azurerm_eventhub_namespace.aehn[0].default_primary_key
  description = "The primary access key for the authorization rule RootManageSharedAccessKey"
}
output "aehn_default_secondary_key" {
  value       = azurerm_eventhub_namespace.aehn[0].default_secondary_key
  description = "The secondary access key for the authorization rule RootManageSharedAccessKey."
}
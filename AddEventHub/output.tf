# ==============================================================================
# Azure Event Hub Namespace - Output variables
# ==============================================================================
output "aehn_name" {
  value       = [for instance in azurerm_eventhub.aeh : instance.namespace_name]
  description = "Event Hub Namespace Name."
}

# ==============================================================================
# Azure Event Hub - Output variables
# ==============================================================================
output "aeh_id" {
  value       = [for instance in azurerm_eventhub.aeh : instance.id]
  description = "Event Hub Id."
}
output "aeh_name" {
  value       = [for instance in azurerm_eventhub.aeh : instance.name]
  description = "Event Hub Name."
}
output "aeh_partition_ids" {
  value       = [for instance in azurerm_eventhub.aeh : instance.partition_ids]
  description = "The identifiers for partitions created for Event Hubs."
}

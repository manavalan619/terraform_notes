# ==============================================================================
# Event Hub Consumer Group - Output variables
# ==============================================================================
output "aehcg_id" {
    value       = [for instance in azurerm_eventhub_consumer_group.aehcg : instance.id]
    description = "Event Hub Consumer Group ID."
}
output "aehcg_name" {
    value       = [for instance in azurerm_eventhub_consumer_group.aehcg : instance.name]
    description = "Event Hub Consumer Group Name."
}
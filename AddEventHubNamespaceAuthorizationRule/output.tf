# ==============================================================================
# Event Hub Namespace Authorization Rules - Output variables
# ==============================================================================
output "aehar_id" {
    value       = [for instance in azurerm_eventhub_namespace_authorization_rule.aehar : instance.id]
    description = "The EventHub Namespace Authorization Rule ID."
}
output "aehar_primary_key" {
    value       = [for instance in azurerm_eventhub_namespace_authorization_rule.aehar : instance.primary_key]
    description = "The Primary Key for the Authorization Rule."
}
output "aehar_primary_connection_string" {
    value       = [for instance in azurerm_eventhub_namespace_authorization_rule.aehar : instance.primary_connection_string]
    description = "The Primary Connection String for the Authorization Rule."
}
output "aehar_secondary_key" {
    value       = [for instance in azurerm_eventhub_namespace_authorization_rule.aehar : instance.secondary_key]
    description = "The Secondary Key for the Authorization Rule."
}
output "aehar_secondary_connection_string" {
    value       = [for instance in azurerm_eventhub_namespace_authorization_rule.aehar : instance.secondary_connection_string]
    description = "The Secondary Connection String for the Authorization Rule."
}

# ==============================================================================
# Logic App Workflow - Output variables
# ==============================================================================
output "alaw_id" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.id]
  description = "The Logic App Workflow ID."
}
output "alaw_name" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.name]
  description = "The Logic App Workflow Name."
}
output "alaw_access_endpoint" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.access_endpoint]
  description = "The Access Endpoint for the Logic App Workflow."
}
output "alaw_connector_endpoint_ip_addresses" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.connector_endpoint_ip_addresses]
  description = "The list of access endpoint ip addresses of connector."
}
output "alaw_connector_outbound_ip_addresses" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.connector_outbound_ip_addresses]
  description = "The list of outgoing ip addresses of connector."
}
output "alaw_workflow_endpoint_ip_addresses" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.workflow_endpoint_ip_addresses]
  description = "The list of access endpoint ip addresses of workflow."
}
output "alaw_workflow_outbound_ip_addresses" {
  value       = [for instance in azurerm_logic_app_workflow.alaw : instance.workflow_outbound_ip_addresses]
  description = "The list of outgoing ip addresses of workflow."
}

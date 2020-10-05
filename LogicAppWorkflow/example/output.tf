# ==============================================================================
# Logic App Workflow - Output variables
# ==============================================================================
output "alaw_id" {
  value       = module.alaw.alaw_id
  description = "The Logic App Workflow ID."
}
output "alaw_name" {
  value       = module.alaw.alaw_name
  description = "The Logic App Workflow Name."
}
output "alaw_access_endpoint" {
  value       = module.alaw.alaw_id
  description = "The Access Endpoint for the Logic App Workflow."
}
output "alaw_connector_endpoint_ip_addresses" {
  value       = module.alaw.alaw_connector_endpoint_ip_addresses
  description = "The list of access endpoint ip addresses of connector."
}
output "alaw_connector_outbound_ip_addresses" {
  value       = module.alaw.alaw_connector_outbound_ip_addresses
  description = "The list of outgoing ip addresses of connector."
}
output "alaw_workflow_endpoint_ip_addresses" {
  value       = module.alaw.alaw_workflow_endpoint_ip_addresses
  description = "The list of access endpoint ip addresses of workflow."
}
output "alaw_workflow_outbound_ip_addresses" {
  value       = module.alaw.alaw_workflow_outbound_ip_addresses
  description = "The list of outgoing ip addresses of workflow."
}

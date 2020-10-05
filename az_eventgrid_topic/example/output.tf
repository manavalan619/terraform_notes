# ==============================================================================
# EventGrid Event Topic - Output variables
# ==============================================================================

output "aegt_name" {
  value       = module.aegt.aegt_name
  description = "The EventGrid Topic Name."
}

output "aegt_id" {
  value       = module.aegt.aegt_id
  description = "The EventGrid Topic ID."
}

output "aegt_primary_access_key" {
  value       = module.aegt.aegt_primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Topic."
}

output "aegt_secondary_access_key" {
  value       = module.aegt.aegt_secondary_access_key
  description = "The Secondary Shared Access Key associated with the EventGrid Topic."
}

output "aegt_endpoint" {
  value       = module.aegt.aegt_endpoint
  description = "The Endpoint associated with the EventGrid Topic."
}
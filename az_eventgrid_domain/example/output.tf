# ==============================================================================
# EventGrid Domain - Output variables
# ==============================================================================

output "aegd_name" {
  value       = module.aegd.aegd_name
  description = "The Name of the EventGrid Domain."
}

output "aegd_id" {
  value       = module.aegd.aegd_id
  description = "The ID of the EventGrid Domain."
}

output "aegd_primary_access_key" {
  value       = module.aegd.aegd_primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Domain."
}

output "aegd_secondary_access_key" {
  value       = module.aegd.aegd_secondary_access_key
  description = "The Secondary Shared Access Key associated with the EventGrid Domain."
}

output "aegd_endpoint" {
  value       = module.aegd.aegd_endpoint
  description = "The Endpoint associated with the EventGrid Domain."
}
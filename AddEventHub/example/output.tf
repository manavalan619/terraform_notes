# ==============================================================================
# Azure Event Hub Namespace - Output variables
# ==============================================================================
output "aehn_name" {
  value       = module.aehn.aehn_name
  description = "Event Hub Namespace Name."
}

# ==============================================================================
# Azure Event Hub - Output variables
# ==============================================================================
output "aeh_id" {
  value       = module.aeh.aeh_id
  description = "Event Hub Id."
}
output "aeh_name" {
  value       = module.aeh.aeh_name
  description = "Event Hub Name."
}
output "aeh_partition_ids" {
  value       = module.aeh.aeh_partition_ids
  description = "The identifiers for partitions created for Event Hubs."
}

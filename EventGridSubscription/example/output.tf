# ==============================================================================
# EventGrid Event Subscription - Output variables
# ==============================================================================

output "aeges_name" {
  value       = module.aeges.aeges_name
  description = "The Name of the EventGrid Event Subscription."
}

output "aeges_id" {
  value       = module.aeges.aeges_id
  description = "The ID of the EventGrid Event Subscription."
}

# ==============================================================================
# DATA  MODULES  - Output variables
# ==============================================================================

output "asa_name" {
  value       = module.asa.asa_name
  description = "The Storage Account Name."
}

output "asq_name" {
  value       = module.asq.asq_name
  description = "The Storage Queue Name."
}

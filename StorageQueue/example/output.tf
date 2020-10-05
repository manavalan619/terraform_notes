# ==============================================================================
# ASQ  MODULES - Output variables
# ==============================================================================

output "asq_id" {
  value       = module.asq.asq_id
  description = "The ID of the Storage Queue."
}

output "asq_name" {
  value       = module.asq.asq_name
  description = "The Name of the Storage Queue."
}

# ==============================================================================
# DATA  MODULES - Output variables
# ==============================================================================

output "asa_name" {
  value       = module.asa.asa_name
  description = "The Storage Account Name."
}
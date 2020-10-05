# ==============================================================================
# ASQ  MODULES - Output variables
# ==============================================================================

output "asq_id" {
  value       = [for instance in azurerm_storage_queue.asq : instance.id]
  description = " The ID of the Storage Queue."
}

output "asq_name" {
  value       = [for instance in azurerm_storage_queue.asq : instance.name]
  description = " The Name of the Storage Queue."
}
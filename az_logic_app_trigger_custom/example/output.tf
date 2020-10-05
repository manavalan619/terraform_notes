# ==============================================================================
# Logic App Trigger Custom - Output variables
# ==============================================================================
output "alatc_name" {
  value       = module.alatc.alatc_name
  description = "The Name of the Trigger within the Logic App Workflow."
}

output "alatc_id" {
  value       = module.alatc.alatc_id
  description = "The ID of the Trigger within the Logic App Workflow."
}

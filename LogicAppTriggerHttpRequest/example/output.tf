# ==============================================================================
# Logic App Trigger Http Request - Output variables
# ==============================================================================
output "alathr_id" {
  value       = module.alathr.alathr_id
  description = "The ID of the HTTP Request Trigger within the Logic App Workflow."
}

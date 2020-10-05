# ==============================================================================
# Logic App Trigger Recurrence - Output variables
# ==============================================================================
output "alatr_id" {
  value       = module.alatr.alatr_id
  description = "The ID of the Recurrence Trigger within the Logic App Workflow"
}

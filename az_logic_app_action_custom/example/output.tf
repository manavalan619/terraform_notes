# ==============================================================================
# Logic App Action Custom - Output variables
# ==============================================================================
output "alaac_id" {
  value       = module.alaac.alaac_id
  description = "The ID of the Action within the Logic App Workflow."
}
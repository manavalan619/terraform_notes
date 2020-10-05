# ==============================================================================
# Logic App Action Http - Output variables
# ==============================================================================
output "laah_id" {
  value       = module.laah.laah_id
  description = "The ID of the HTTP Action within the Logic App Workflow. "
}

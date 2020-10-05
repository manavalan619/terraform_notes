# ==============================================================================
# Logic App Action Custom - Output variables
# ==============================================================================

output "alaac_id" {
  value       = azurerm_logic_app_action_custom.alaac[0].id
  description = "The ID of the Action within the Logic App Workflow."
}

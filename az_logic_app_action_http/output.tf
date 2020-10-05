# ==============================================================================
# Logic App Action Http - Output variables
# ==============================================================================
output "laah_id" {
  value       = azurerm_logic_app_action_http.laah[0].id
  description = "The ID of the HTTP Action within the Logic App Workflow."
}

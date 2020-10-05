# ==============================================================================
# Logic App Trigger Custom - Output variables
# ==============================================================================
output "alatc_name" {
  value       = azurerm_logic_app_trigger_custom.alatc[0].name
  description = "The Name of the Trigger within the Logic App Workflow."
}

output "alatc_id" {
  value       = azurerm_logic_app_trigger_custom.alatc[0].id
  description = "The ID of the Trigger within the Logic App Workflow."
}
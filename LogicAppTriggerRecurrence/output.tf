# ==============================================================================
# Logic App Trigger Recurrence - Output variables
# ==============================================================================
output "alatr_id" {
    value       = [for instance in azurerm_logic_app_trigger_recurrence.alatr : instance.id]
    description = "The ID of the Recurrence Trigger within the Logic App Workflow"
}
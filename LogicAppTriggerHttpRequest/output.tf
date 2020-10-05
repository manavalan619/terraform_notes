# ==============================================================================
# Logic App Trigger Http Request - Output variables
# ==============================================================================
output "alathr_id" {
    value       = [for instance in azurerm_logic_app_trigger_http_request.alathr : instance.id]
    description = "The ID of the HTTP Request Trigger within the Logic App Workflow."
}
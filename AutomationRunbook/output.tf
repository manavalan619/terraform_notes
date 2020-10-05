# ==============================================================================
# Automation Runbook - Output variables
# ==============================================================================
output "aar_id" {
    value       = [for instance in azurerm_automation_runbook.aar : instance.id]
    description = "The Automation Runbook ID."
}


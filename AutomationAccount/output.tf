# ==============================================================================
# Automation account - Output variables
# ==============================================================================
output "aaa_id" {
  value       = [for instance in azurerm_automation_account.aaa : instance.id]
  description = "id - The Automation Account ID."
}
output "aaa_name" {
  value       = [for instance in azurerm_automation_account.aaa : instance.name]
  description = "The Automation Account Name"
}

output "aaa_dsc_server_endpoint" {
  value       = [for instance in azurerm_automation_account.aaa : instance.dsc_server_endpoint]
  description = "The DSC Server Endpoint associated with this Automation Account."
}

output "aaa_dsc_primary_access_key" {
  value       = [for instance in azurerm_automation_account.aaa : instance.dsc_primary_access_key]
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account"
}

output "aaa_dsc_secondary_access_key" {
  value       = [for instance in azurerm_automation_account.aaa : instance.dsc_secondary_access_key]
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account."
}


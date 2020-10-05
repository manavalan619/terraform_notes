# ==============================================================================
# Databricks worskpace - Output variables
# ==============================================================================
output "adb_id" {
    value       = [for instance in azurerm_databricks_workspace.adb : instance.id]
    description = "Databricks Workspace ID."
}
output "adb_name" {
    value       = [for instance in azurerm_databricks_workspace.adb : instance.name]
    description = "Databricks Workspace Name."
}
output "adb_managed_resource_group_id" {
    value       = [for instance in azurerm_databricks_workspace.adb : instance.managed_resource_group_id]
    description = "The ID of the Managed Resource Group created by the Databricks Workspace."
}
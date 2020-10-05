# ==============================================================================
# Databricks worskpace - Output variables
# ==============================================================================
output "adb_id" {
  value       = module.databx4.adb_id
  description = "Databricks Workspace ID."
}
output "adb_name" {
  value       = module.databx4.adb_name
  description = "Databricks Workspace Name."
}
output "adb_managed_resource_group_id" {
  value       = module.databx4.adb_managed_resource_group_id
  description = "The ID of the Managed Resource Group created by the Databricks Workspace."
}
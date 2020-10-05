# ======================================================
# SQL Virtual Network Rule - Output Variables
# ======================================================
output "asvnr_id" {
  value       = [for instance in azurerm_sql_virtual_network_rule.asvnr : instance.id]
  description = "The ID of the SQL virtual network rule."
}

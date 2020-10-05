# ==============================================================================
# SQL Server Firewall - Output Variables
# ==============================================================================s
output "sqlsrv_fw_id" {
    value       = [for instance in azurerm_sql_firewall_rule.asfw : instance.id]
    description = "SQL Server Firewall ID."
}

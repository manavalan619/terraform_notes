# ==============================================================================
# SQL Server - Output variables
# ==============================================================================
output "sqlsrv_id" {
    value       = [for instance in azurerm_sql_server.sqlsrv : instance.id]
    description = "SQL Server ID."
}
output "sqlsrv_fully_qualify_domain_name" {
    value       = [for instance in azurerm_sql_server.sqlsrv : instance.fully_qualified_domain_name]
    description = "SQL Server FQDN."
}
output "sqlsrv_name" {
    value       = [for instance in azurerm_sql_server.sqlsrv : instance.name]
}
output "sqlsrv_password" {
    value       = [for instance in azurerm_sql_server.sqlsrv : instance.administrator_login_password]
    description = "SQL Server Password."
    sensitive   = true
}
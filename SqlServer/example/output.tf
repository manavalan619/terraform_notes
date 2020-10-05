# ==============================================================================
# SQL Server - Output variables
# ==============================================================================
output "sqlsrv_id" {
  value       = module.sql-srv.sqlsrv_id
  description = "SQL Server ID."
}
output "sqlsrv_fully_qualify_domain_name" {
  value       = module.sql-srv.sqlsrv_fully_qualify_domain_name
  description = "SQL Server FQDN."
}
output "sqlsrv_name" {
  value       = module.sql-srv.sqlsrv_name
  description = "SQL Server Name."
}
output "sqlsrv_password" {
  value       = module.sql-srv.sqlsrv_password
  sensitive   = true
  description = "SQL Server Password."
}
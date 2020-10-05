output "sqlsrv_id" {
  value       = module.asdb.sqlsrv_id
  description = "SQL Server ID."
}

output "sqlsrv_fully_qualify_domain_name" {
  value       = module.asdb.sqlsrv_fully_qualify_domain_name
  description = "SQL Server FQDN."
}

output "sqlsrv_name" {
  value       = module.asdb.sqlsrv_name
  description = "SQL Server Name."
}
output "sqlsrv_password" {
  value       = module.asdb.sqlsrv_password
  sensitive   = true
  description = "SQL Server Password."
}

output "sqlsrv_fw_id" {
  value       = module.asdb.sqlsrv_fw_id
  description = "SQL Server Firewall ID."
}

output "sqldb_id" {
  value       = module.asdb.sqldb_id
  description = "SQL DB ID."
}
output "sqldb_creation_date" {
  value       = module.asdb.sqldb_creation_date
  description = "The creation date of the SQL Database."
}
output "sqldb_default_secondary_location" {
  value       = module.asdb.sqldb_default_secondary_location
  description = "SQL DB ID."
}
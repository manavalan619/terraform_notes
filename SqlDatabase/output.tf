# ==============================================================================
# SQL DATABASE module - SQL Server submodule - Output variables
# ==============================================================================
output "sqlsrv_id" {
    value       = module.sqlsrv.sqlsrv_id
    description = "SQL Server ID."
}
output "sqlsrv_fully_qualify_domain_name" {
    value       = module.sqlsrv.sqlsrv_fully_qualify_domain_name
    description = "SQL Server FQDN."
}
output "sqlsrv_name" {
    value       = module.sqlsrv.sqlsrv_name
    description = "SQL Server Name."
}
output "sqlsrv_password" {
    value = module.sqlsrv.sqlsrv_password
    description = "SQL Server Password."
    sensitive   = true
}

# ==============================================================================
# SQL DATABASE module - SQL Server Firewall submodule - Output variables
# ==============================================================================
output "sqlsrv_fw_id" {
    value       = module.sqlsrv_fw.sqlsrv_fw_id
    description = "SQL Server Firewall ID."
}

# ==============================================================================
# SQL DATABASE module - Add SQL Database submodule - Output variables
# ==============================================================================
output "sqldb_id" {
    value       = module.sqldb.sqldb_id
    description = "SQL DB ID."
}
output "sqldb_creation_date" {
    value       = module.sqldb.sqldb_creation_date
    description = "The creation date of the SQL Database."
}
output "sqldb_default_secondary_location" {
    value       = module.sqldb.sqldb_default_secondary_location
    description = "SQL DB ID."
}
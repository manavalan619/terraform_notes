# ==============================================================================
# SQL Server Firewall - Output Variables
# ==============================================================================s
output "sqlsrv_fw_id" {
  value       = module.sql_srv_fw.sqlsrv_fw_id
  description = "SQL Server Firewall ID."
}
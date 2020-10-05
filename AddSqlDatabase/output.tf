# ==============================================================================
# SQL DB - Output variables
# ==============================================================================
output "sqldb_id" {
  value       = [for instance in azurerm_sql_database.sqldb : instance.id]
  description = "SQL DB ID."
}
output "sqldb_creation_date" {
  value       = [for instance in azurerm_sql_database.sqldb : instance.creation_date]
  description = "The creation date of the SQL Database."
}
output "sqldb_default_secondary_location" {
  value       = [for instance in azurerm_sql_database.sqldb : instance.default_secondary_location]
  description = "The default secondary location of the SQL Database."
}

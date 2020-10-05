# ==============================================================================
# SQL DB - Output variables
# ==============================================================================
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
  description = "The default secondary location of the SQL Database."
}

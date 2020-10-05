# ==============================================================================
# Storage Account - Output variables
# ==============================================================================
output "asa_name" {
  value       = module.asa.asa_name
  description = "The Storage Account Name."
}
output "asa_id" {
  value       = module.asa.asa_id
  description = "The Storage Account ID."
}
output "asa_connection_string" {
  value       = module.asa.asa_connection_string
  description = "The connection string associated with the primary location."
}
output "asa_primary_blob_connection_string" {
  value       = module.asa.asa_primary_blob_connection_string
  description = "The connection string associated with the primary blob location."
}

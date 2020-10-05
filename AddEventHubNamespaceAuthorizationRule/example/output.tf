# ==============================================================================
# Event Hub Namespace Authorization Rules - Output variables
# ==============================================================================
output "aehar_id" {
  value       = module.aehar.aehar_id
  description = "The EventHub Namespace Authorization Rule ID."
}
output "aehar_primary_key" {
  value       = module.aehar.aehar_primary_key
  description = "The Primary Key for the Authorization Rule."
}
output "aehar_primary_connection_string" {
  value       = module.aehar.aehar_primary_connection_string
  description = "The Primary Connection String for the Authorization Rule."
}
output "aehar_secondary_key" {
  value       = module.aehar.aehar_secondary_key
  description = "The Secondary Key for the Authorization Rule."
}
output "aehar_secondary_connection_string" {
  value       = module.aehar.aehar_secondary_connection_string
  description = "The Secondary Connection String for the Authorization Rule."
}
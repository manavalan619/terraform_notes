# ==============================================================================
# Automation account - Output variables
# ==============================================================================
output "aaa_id" {
  value       = module.aaa.aaa_id
  description = "id - The Automation Account ID."
}
output "aaa_name" {
  value       = module.aaa.aaa_name
  description = "The Automation Account Name"
}
output "aaa_dsc_server_endpoint" {
  value       = module.aaa.aaa_dsc_server_endpoint
  description = "The DSC Server Endpoint associated with this Automation Account."
}

output "aaa_dsc_primary_access_key" {
  value       = module.aaa.aaa_dsc_primary_access_key
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account"
}

output "aaa_dsc_secondary_access_key" {
  value       = module.aaa.aaa_dsc_secondary_access_key
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account."
}


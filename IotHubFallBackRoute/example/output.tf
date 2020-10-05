# ==============================================================================
# Iot Hub Fall Back Route - Output variables
# ==============================================================================

output "aiothfbr_id" {
  value       = module.aiothfbr.aiothfbr_id
  description = "The ID of the IoTHub Fallback Route."
}


# ==============================================================================
# Output variables - Data Modules
# ==============================================================================

output "asa_primary_blob_connection_string" {
  value       = module.asa.asa_primary_blob_connection_string
  description = "The connection string associated with the primary blob location."
}

output "asa_name" {
  value       = module.asa.asa_name
  description = "The name of storage account."
}

output "ascn_name" {
  value       = module.ascn.ascn_name
  description = "The name of storage container"
}

output "aioth_name" {
  value       = module.aioth.aioth_name
  description = "The Name of the IoTHub."
}

output "aiothepsc_name" {
  value       = module.aiothepsc.aiothepsc_name
  description = "The Name of the IotHub Storage Container Endpoint."
}

output "aiothepsc_id" {
  value       = module.aiothepsc.aiothepsc_id
  description = "The ID of the IoTHub Storage Container Endpoint."
}
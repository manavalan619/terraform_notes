# ==============================================================================
# App Service Plan - Output variables
# ==============================================================================
output "aasp_id" {
  value       = module.aasp.aasp_id
  description = "The App Service Plan ID."
}
output "aasp_maximum_number_of_workers" {
  value       = module.aasp.aasp_maximum_number_of_workers
  description = "The maximum number of workers supported with the App Service Plan's sku."
}

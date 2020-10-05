# ==============================================================================
# AFA Output variables
# ==============================================================================
output "asa_id" {
  value       = module.asa.asa_id
  description = "The Storage Account ID."
}
output "asa_connection_string" {
  value       = module.asa.asa_connection_string
  description = "The Storage Account Connection String."
}

output "aasp_id" {
  value       = module.aasp.aasp_id
  description = "The App Service Plan ID."
}

output "afa_site_credential" {
  value       = module.afa.afa_site_credential
  description = "A site_credential block, which contains the site-level credentials used to publish to this App Service."
}

output "afa_identity_id" {
  value       = module.afa.afa_identity_id
  description = "An identity block, which contains the Managed Service Identity information for this App Service."
}

output "project_resource_group_name" {
  value       = module.rg.project_resource_group_name
  description = " The name of the Resource Group."
}

output "project_resource_group_location" {
  value       = module.rg.project_resource_group_location
  description = " The location of the Resource Group."

}

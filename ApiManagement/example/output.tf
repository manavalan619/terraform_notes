# ======================================================
# APIM output variables
# ======================================================

output "apim_id" {
  value       = module.apim.apim_id
  description = "The ID of the API Management Service."
}

output "apim_gateway_regional_url" {
  value       = module.apim.apim_gateway_regional_url
  description = "The Region URL for the Gateway of the API Management Service."
}

output "apim_management_api_url" {
  value       = module.apim.apim_management_api_url
  description = "The URL for the Management API associated with this API Management service."
}

output "apim_portal_url" {
  value       = module.apim.apim_portal_url
  description = "The URL for the Publisher Portal associated with this API Management service."
}
output "apim_public_ip_addresses" {
  value       = module.apim.apim_public_ip_addresses
  description = "The Public IP addresses of the API Management Service."
}

output "apim_scm_url" {
  value       = module.apim.apim_scm_url
  description = "The URL for the SCM (Source Code Management) Endpoint associated with this API Management service."
}




# ==============================================================================
# App service environment - Output variables
# ==============================================================================
# output "avnet_id" {
#   value       = module.avnet.avnet_id
#   description = "The ID of the virtual network."
# }

# output "avnet_name" {
#   value       = module.avnet.avnet_name
#   description = "The name of the virtual network."
# }

# output "andpl_name" {
#   value       = module.andpl.andpl_name
#   description = "The ID of the DDoS Protection Plan"
# }

# output "andpl_id" {
#   value       = module.andpl.andpl_id
#   description = "The ID of the DDoS Protection Plan"
# }


# output "subnet_id" {
#   value       = module.subnet.subnet_id
#   description = "The ID of the subnet."
# }

# output "avnet_subnet" {
#   value       = module.avnet.avnet_subnet
#   description = "The name of the subnet."
# }


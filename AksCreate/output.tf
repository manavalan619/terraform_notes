# ==============================================================================
# Key Vault infra 
# ==============================================================================
# output "akv_infra_id" {
#     value       = module.keyvault-infra.akv_id
#     description = "Key Vault infra ID."
# }
# output "akv_infra_vault_uri" {
#     value       = module.keyvault-infra.akv_vault_uri
#     description = "Key Vault infra URI"
# }
# ==============================================================================
# AKS vnet  
# ==============================================================================
output "aks_avnet_id" {
    value       = module.vnet_aks.avnet_id
    description = "The ID of the virtual network."
}
output "aks_avnet_name" {
    value       = module.vnet_aks.avnet_name
    description = "The name of the virtual network."
}
output "aks_avnet_resource_group_name" {
    value       = module.vnet_aks.avnet_resource_group_name
    description = "The name of the resource group in which the virtual network is created in."
}
output "aks_avnet_virtual_network_location" {
    value       = module.vnet_aks.avnet_virtual_network_location
    description = "the location where the virtual network is created."
}
output "aks_avnet_virtual_network_adress_space" {
    value       = module.vnet_aks.avnet_virtual_network_adress_space
    description = "The address space that is used the virtual network."
}
# ==============================================================================
# aks_kube_subnet
# ==============================================================================
output "aks_kube_subnet_id" {
    value       = module.aks_kube_subnet.subnet_id
    description = "The ID of the subnet."
}
output "aks_kube_subnet_name" {
    value       = module.aks_kube_subnet.subnet_name
    description = "The name of the subnet."
}
output "aks_kube_subnet_resource_group_name" {
    value       = module.aks_kube_subnet.subnet_resource_group_name
    description = "The name of the resource group in which the subnet is created in."
}
output "aks_kube_subnet_virtual_network_name" {
    value       = module.aks_kube_subnet.subnet_virtual_network_name
    description = "The name of the virtual network in which the subnet is created in."
}
# ==============================================================================
# aks_sql_subnet (TODO : à incorper au databricks module venetisé)
# ==============================================================================
# output "aks_sql_subnet_id" {
#     value       = module.aks_sql_subnet.subnet_id
#     description = "The ID of the subnet."
# }
# output "aks_sql_subnet_name" {
#     value       = module.aks_sql_subnet.subnet_name
#     description = "The name of the subnet."
# }
# output "aks_sql_subnet_resource_group_name" {
#     value       = module.aks_sql_subnet.subnet_resource_group_name
#     description = "The name of the resource group in which the subnet is created in."
# }
# output "aks_sql_subnet_virtual_network_name" {
#     value       = module.aks_sql_subnet.subnet_virtual_network_name
#     description = "The name of the virtual network in which the subnet is created in."
# }
# ==============================================================================
# aks_apim_subnet
# ==============================================================================
output "aks_apim_subnet_id" {
    value       = module.aks_apim_subnet.subnet_id
    description = "The ID of the subnet."
}
output "aks_apim_subnet_name" {
    value       = module.aks_apim_subnet.subnet_name
    description = "The name of the subnet."
}
output "aks_apim_subnet_resource_group_name" {
    value       = module.aks_apim_subnet.subnet_resource_group_name
    description = "The name of the resource group in which the subnet is created in."
}
output "aks_apim_subnet_virtual_network_name" {
    value       = module.aks_apim_subnet.subnet_virtual_network_name
    description = "The name of the virtual network in which the subnet is created in."
}
# ==============================================================================
# aks_appgw_subnet
# ==============================================================================
output "aks_appgw_subnet_id" {
    value       = module.aks_appgw_subnet.subnet_id
    description = "The ID of the subnet."
}
output "aks_appgw_subnet_name" {
    value       = module.aks_appgw_subnet.subnet_name
    description = "The name of the subnet."
}
output "aks_appgw_subnet_resource_group_name" {
    value       = module.aks_appgw_subnet.subnet_resource_group_name
    description = "The name of the resource group in which the subnet is created in."
}
output "aks_appgw_subnet_virtual_network_name" {
    value       = module.aks_appgw_subnet.subnet_virtual_network_name
    description = "The name of the virtual network in which the subnet is created in."
}

# ==================================================================================
# Azure Public IP - Output Variables
# ==================================================================================
output "appgw_apip_id" {
    value       = module.appgw_frontend_public_ip.apip_id
    description = "The Public IP ID."
}
output "appgw_apip_ip_address" {
    value       = module.appgw_frontend_public_ip.apip_ip_address
    description = "The IP address value that was allocated."
}
output "appgw_apip_fqdn" {
    value       = module.appgw_frontend_public_ip.apip_fqdn
    description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}

# ==============================================================================
# App Gw User Assigned Identity - Output variables
# ==============================================================================
output "appgw_uai_id" {
    value       = module.appgw_user_assigned_identity.uai_id
    description = "The user assigned identity ID."
}
output "appgw_uai_principal_id" {
    value       = module.appgw_user_assigned_identity.uai_principal_id
    description = "Service Principal ID associated with the user assigned identity."
}
output "appgw_uai_client_id" {
    value       = module.appgw_user_assigned_identity.uai_client_id
    description = "Client ID associated with the user assigned identity."
}

# ==============================================================================
# Application Gateway - Output variables
# ==============================================================================
output "appgw_id" {
  description = "The ID of the Application Gateway."
  value       = module.appgw.appgw_id
}
output "appgw_authentication_certificate" {
  description = "A authentication_certificate block exporting the iD of the Authentication Certificate."
  value       = module.appgw.appgw_authentication_certificate
}
output "appgw_backend_address_pool" {
  description = "A list of backend_address_pool blocks. Export of The ID of the Backend Address Pool"
  value       = module.appgw.appgw_backend_address_pool
}
output "appgw_backend_http_settings" {
  description = "A list of backend_http_settings blocks. Export of The ID of the Backend HTTP Settings Configuration + The ID of the associated Probe."
  value       = module.appgw.appgw_backend_http_settings
}
output "appgw_frontend_ip_configuration" {
  description = "A list of frontend_ip_configuration blocks. Export of The ID of the Frontend Port."
  value       = module.appgw.appgw_frontend_ip_configuration
}
output "appgw_frontend_port" {
  description = "A list of frontend_port blocks."
  value       = module.appgw.appgw_frontend_port
}
output "appgw_gateway_ip_configuration" {
  description = "A list of gateway_ip_configuration blocks. Export of The ID of the Gateway IP Configuration."
  value       = module.appgw.appgw_gateway_ip_configuration
}
output "appgw_enable_http2" {
  description = "(Optional) Is HTTP2 enabled on the application gateway resource? Defaults to false."
  value       = module.appgw.appgw_enable_http2
}
output "appgw_http_listener" {
  description = "A list of http_listener blocks as defined below. Export of the ID of the HTTP Listener, The ID of the associated Frontend Configuration, the ID of the associated Frontend Port"
  value       = module.appgw.appgw_http_listener
}
output "appgw_probe" {
  description = "A probe block. Export of The Name of the Probe, The Hostname used for this Probe, The Interval between two consecutive probes in seconds, "
  value       = module.appgw.appgw_probe
}
output "appgw_request_routing_rule" {
  description = "A list of request_routing_rule blocks. Export of The ID of the Request Routing Rule,  The ID of the associated HTTP Listener, The ID of the associated Backend Address Pool, etc.."
  value       = module.appgw.appgw_request_routing_rule
}
output "appgw_ssl_certificate" {
  description = "A list of ssl_certificate blocks. Export of The Name of the SSL certificate that is unique within this Application Gateway, etc"
  value       = module.appgw.appgw_ssl_certificate
}
output "appgw_url_path_map" {
  description = "A list of url_path_map blocks. Export of The Name of the URL Path Map, the default_backend_address_pool_name etc."
  value       = module.appgw.appgw_url_path_map
}
output "appgw_custom_error_configuration" {
  description = "A list of custom_error_configuration blocks. Export of The ID of the Custom Error Configuration"
  value       = module.appgw.appgw_custom_error_configuration
}
output "appgw_redirect_configuration" {
  description = "A list of redirect_configuration blocks. Export of The ID of the Redirect Configuration."
  value       = module.appgw.appgw_redirect_configuration
}

# ==============================================================================
# Azure Private DNS Zone - Output variables (aks_vnet_private_dns_zone)
# ==============================================================================
output "aks_vnet_pdz_id" {
    value       = module.aks_vnet_private_dns_zone.pdz_id
    description = "The Private DNS Zone ID."
}
output "aks_vnet_pdz_number_of_record_sets" {
    value       = module.aks_vnet_private_dns_zone.pdz_number_of_record_sets
    description = "The current number of record sets in this Private DNS zone."
}
output "aks_vnet_pdz_max_number_of_record_sets" {
    value       = module.aks_vnet_private_dns_zone.pdz_max_number_of_record_sets
    description = "The maximum number of record sets that can be created in this Private DNS zone."
}
output "aks_vnet_max_number_of_virtual_network_links" {
    value       = module.aks_vnet_private_dns_zone.pdz_max_number_of_virtual_network_links
    description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
}
output "aks_vnet_pdz_max_number_of_virtual_network_links_with_registration" {
    value       = module.aks_vnet_private_dns_zone.pdz_max_number_of_virtual_network_links_with_registration
    description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
}

# ==============================================================================
# Apim User Assigned Identity - Output variables
# ==============================================================================
output "apim_uai_id" {
    value       = module.apim_user_assigned_identity.uai_id
    description = "The user assigned identity ID."
}
output "apim_uai_principal_id" {
    value       = module.apim_user_assigned_identity.uai_principal_id
    description = "Service Principal ID associated with the user assigned identity."
}
output "apim_uai_client_id" {
    value       = module.apim_user_assigned_identity.uai_client_id
    description = "Client ID associated with the user assigned identity."
}

# ======================================================
# APIM output variables
# ======================================================
output "apim_gateway_regional_url" {
  value       = module.apim.apim_gateway_regional_url
  description = "The Region URL for the Gateway of the API Management Service."
}
output "apim_id" {
  value       = module.apim.apim_id
  description = "The ID of the API Management Service."
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

# ========================================================================
# AKS Admin private ssh key - Output
# ========================================================================
# output "aks_admin_public_key_openssh" {
#   description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves P256, P384 and P521 are supported. This attribute is empty if an incompatible ECDSA curve is selected."
#   # value       = tls_private_key.aks_ssh_key[0].public_key_openssh
#   value       = [for instance in tls_private_key.aks_ssh_key : instance.public_key_openssh]
# }

# ======================================================
# AKS Cluster - Output Variables
# ======================================================
output "aks_cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = module.aks.aks_cluster_id
}
output "aks_cluster_fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = module.aks.aks_cluster_fqdn
}
output "aks_cluster_private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = module.aks.aks_cluster_private_fqdn
}
output "aks_kube_admin_config" {
  description = "A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = module.aks.aks_kube_admin_config
}
output "aks_kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = module.aks.aks_kube_admin_config_raw
}
output "aks_kube_config" {
  description = "A kube_config block as defined below."
  value       = module.aks.aks_kube_config
}
output "aks_kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = module.aks.aks_kube_config_raw
}
# output "aks_http_application_routing" {
#   description = "http_application_routing exporting the Zone Name of the HTTP Application Routing."
#   value       = module.aks.aks_http_application_routing
# }
output "aks_node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = module.aks.aks_node_resource_group
}
# output "aks_kubelet_identity" {
#   description = "A kubelet_identity block as defined below."
#   value       = module.aks.aks_kubelet_identity
# }

# ==============================================================================
# Azure Container Registry - Output variables
# ==============================================================================
output "acr_id" {
    value       = module.acr.acr_id
    description = "The ID of the Container Registry."
}
output "acr_login_server" {
    value       = module.acr.acr_login_server
    description = "The URL that can be used to log into the container registry."
}
output "acr_admin_username" {
    value       = module.acr.acr_admin_username
    description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
}
output "acr_admin_password" {
    value       = module.acr.acr_admin_password
    description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
    sensitive   = true
}
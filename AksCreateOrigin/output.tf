# ==================================================================================
# AKS Vnet Integration - outputs
# ==================================================================================
output "aks_vnet_id" {
  value       = var.aks_advanced_networking_enabled && length(azurerm_virtual_network.aks_vnet) > 0 ? azurerm_virtual_network.aks_vnet[0].id : null
  description = "Aks VNET Id created if advanced_networking is aks_vnet_advanced_networking is enabled"
}
output "aks_subnets" {
    value     = var.aks_advanced_networking_enabled && length(azurerm_virtual_network.aks_vnet) > 0 ? tolist(azurerm_virtual_network.aks_vnet[0].subnet) : null
    description = "AKS Networking - Subnets created"
}
output "aks_subnet_id" {
  description = "aks subnet id"
  # value       = azurerm_subnet.aks-subnet[0].id
  value       = [for instance in azurerm_subnet.aks_subnet : instance.id]
  # azurerm_subnet.aks_subnet[0].id
}

# ========================================================================
# AKS Application Gateway - Outputs
# ========================================================================
output "aks_app_gateway_id" {
  description = "The ID of the Application Gateway."
  # value       = azurerm_application_gateway.aks_app_gw[0].id
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.id]
}
output "aks_app_gateway_authentication_certificate" {
  description = "A authentication_certificate block exporting the iD of the Authentication Certificate."
  # value       = azurerm_application_gateway.aks_app_gw[0].authentication_certificate
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.authentication_certificate]
}
output "aks_app_gateway_backend_address_pool" {
  description = "A list of backend_address_pool blocks. Export of The ID of the Backend Address Pool"
  # value       = azurerm_application_gateway.aks_app_gw[0].backend_address_pool
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.backend_address_pool]
}
output "aks_app_gateway_backend_http_settings" {
  description = "A list of backend_http_settings blocks. Export of The ID of the Backend HTTP Settings Configuration + The ID of the associated Probe."
  # value       = azurerm_application_gateway.aks_app_gw[0].backend_http_settings
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.backend_http_settings]
}
output "aks_app_gateway_frontend_ip_configuration" {
  description = "A list of frontend_ip_configuration blocks. Export of The ID of the Frontend Port."
  # value       = azurerm_application_gateway.aks_app_gw[0].frontend_ip_configuration
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.frontend_ip_configuration]
}
output "aks_app_gateway_frontend_port" {
  description = "A list of frontend_port blocks."
  # value       = azurerm_application_gateway.aks_app_gw[0].frontend_port
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.frontend_port]
}
output "aks_app_gateway_gateway_ip_configuration" {
  description = "A list of gateway_ip_configuration blocks. Export of The ID of the Gateway IP Configuration."
  # value       = azurerm_application_gateway.aks_app_gw[0].gateway_ip_configuration
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.gateway_ip_configuration]
}
output "aks_app_gateway_enable_http2" {
  description = "(Optional) Is HTTP2 enabled on the application gateway resource? Defaults to false."
  # value       = azurerm_application_gateway.aks_app_gw[0].enable_http2
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.enable_http2]
}
output "aks_app_gateway_http_listener" {
  description = "A list of http_listener blocks as defined below. Export of the ID of the HTTP Listener, The ID of the associated Frontend Configuration, the ID of the associated Frontend Port"
  # value       = azurerm_application_gateway.aks_app_gw[0].http_listener
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.http_listener]
}
output "aks_app_gateway_probe" {
  description = "A probe block. Export of The Name of the Probe, The Hostname used for this Probe, The Interval between two consecutive probes in seconds, "
  # value       = azurerm_application_gateway.aks_app_gw[0].probe
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.probe]
}
output "aks_app_gateway_request_routing_rule" {
  description = "A list of request_routing_rule blocks. Export of The ID of the Request Routing Rule,  The ID of the associated HTTP Listener, The ID of the associated Backend Address Pool, etc.."
  # value       = azurerm_application_gateway.aks_app_gw[0].request_routing_rule
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.request_routing_rule]
}
output "aks_app_gateway_ssl_certificate" {
  description = "A list of ssl_certificate blocks. Export of The Name of the SSL certificate that is unique within this Application Gateway, etc"
  # value       = azurerm_application_gateway.aks_app_gw[0].ssl_certificate
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.ssl_certificate]
}
output "aks_app_gateway_url_path_map" {
  description = "A list of url_path_map blocks. Export of The Name of the URL Path Map, the default_backend_address_pool_name etc."
  # value       = azurerm_application_gateway.aks_app_gw[0].url_path_map
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.url_path_map]
}
output "aks_app_gateway_custom_error_configuration" {
  description = "A list of custom_error_configuration blocks. Export of The ID of the Custom Error Configuration"
  # value       = azurerm_application_gateway.aks_app_gw[0].custom_error_configuration
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.custom_error_configuration]
} 
output "aks_app_gateway_redirect_configuration" {
  description = "A list of redirect_configuration blocks. Export of The ID of the Redirect Configuration."
  # value       = azurerm_application_gateway.aks_app_gw[0].redirect_configuration
  value       = [for instance in azurerm_application_gateway.aks_app_gw : instance.redirect_configuration]
}

# ==============================================================================
# AKS - App Gateway - FrontEnd - Public IP - Output variables
# ==============================================================================
output "aks_app_gateway_public_ip_id" {
  description = "The Log Analytics Workspace ID."
  # value       = azurerm_public_ip.aks_app_gateway_frontend_public_ip[0].id
  value       = [for instance in azurerm_public_ip.aks_app_gateway_frontend_public_ip : instance.id]
}
output "aks_app_gateway_public_ip_name" {
  description = "The Log Analytics Workspace ID."
  # value       = azurerm_public_ip.aks_app_gateway_frontend_public_ip[0].name
  value       = [for instance in azurerm_public_ip.aks_app_gateway_frontend_public_ip : instance.name]
}

# ==============================================================================
# AKS - Log Analytics Worskpace - Output variables
# ==============================================================================
// Required output (as input param for module log analytics solution)
output "law_id" {
  description = "The Log Analytics Workspace ID."
  value       = module.aks_law.law_id
}
output "law_name" {
  description = "The Log Analytics Workspace Name."
  value       = module.aks_law.law_name
} 
output "law_portal_url" {
  description = "The Portal URL for the Log Analytics Workspace."
  value       = module.aks_law.law_portal_url
}
output "law_primary_shared_key" {
  description = "The Primary shared key for the Log Analytics Workspace."
  value       = module.aks_law.law_primary_shared_key
  sensitive   = true
}
output "law_secondary_shared_key" {
  description = "The Secondary shared key for the Log Analytics Workspace."
  value       = module.aks_law.law_secondary_shared_key
  sensitive   = true
}

# ==============================================================================
# LogAnalyticsSolution - Output variables
# ==============================================================================
output "las_id" {
  description = "The Log Analytics Solution ID associated with the private aks log analytics workspace."
  value       = module.aks_las.las_id
}
output "las_name" {
  description = "The Log Analytics Solution Name associated with the private aks log analytics workspace."
  value       = module.aks_las.las_name 
}

# ==============================================================================
# aks diagnistic settings - Output variables
# ==============================================================================
# output "aks_cluster_diagnostic_setting_id" {
#   description = "The ID of the Diagnostic Setting"
#   # value       = azurerm_monitor_diagnostic_setting.aks_diag[0].id
#   value       = [for instance in azurerm_monitor_diagnostic_setting.aks_diag : instance.id]
# }

# ========================================================================
# AKS Admin private ssh key - Output
# ========================================================================
output "aks_admin_public_key_openssh" {
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves P256, P384 and P521 are supported. This attribute is empty if an incompatible ECDSA curve is selected."
  # value       = tls_private_key.aks_ssh_key[0].public_key_openssh
  value       = [for instance in tls_private_key.aks_ssh_key : instance.public_key_openssh]
}

# ========================================================================
# AKS Cluster - Output
# ========================================================================
output "aks_cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  # value       = azurerm_kubernetes_cluster.aks[0].id
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.id]
}
output "aks_cluster_fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  # value       = azurerm_kubernetes_cluster.aks[0].fqdn
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.fqdn]
}
output "aks_cluster_private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  # value       = azurerm_kubernetes_cluster.aks[0].private_fqdn
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.private_fqdn]
}


// kube_admin_config
# output "aks_cluster_kube_admin_config_client_key" {
#   description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.client_key
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.private_fqdn]
# }
# output "aks_cluster_kube_admin_config_client_certificate" {
#   description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.client_certificate
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.client_certificate]
# }
# output "aks_cluster_kube_admin_config_ca_certificate" {
#   description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.cluster_ca_certificate
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.cluster_ca_certificate]
# }
# output "aks_cluster_kube_admin_config_host" {
#   description = "The Kubernetes cluster server host."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.host
#   value       =  [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.host]
# }
# output "aks_cluster_kube_admin_config_username" {
#   description = "A username used to authenticate to the Kubernetes cluster."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.username
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.username]
# }
# output "aks_cluster_kube_admin_config_password" {
#   description = "A password or token used to authenticate to the Kubernetes cluster."
#   # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config.0.password
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config.0.password]
#   sensitive   = true  
# }  

# output "kube_admin_config" {
#   description = "AKS Admin Config"
#   value       = "${map(
#     "host", join("", azurerm_kubernetes_cluster.aks[0].*.kube_admin_config.0.host),
#     "client_certificate", join("", azurerm_kubernetes_cluster.aks[0].*.kube_admin_config.0.client_certificate),
#     "client_key", join("", azurerm_kubernetes_cluster.aks[0].*.kube_admin_config.0.client_key),
#     "cluster_ca_certificate", join("", azurerm_kubernetes_cluster.aks[0].*.kube_admin_config.0.cluster_ca_certificate)
#     )}"
# }


output "aks_cluster_kube_admin_config_raw" {
  description = ""
  # value       = azurerm_kubernetes_cluster.aks[0].kube_admin_config_raw
  value = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config_raw]
}
output "aks_kube_config" {
  description = "aks kube config."
  # value       = azurerm_kubernetes_cluster.aks[0].kube_config
  value = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config]
  sensitive   = true
}
output "aks_kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  # value       = azurerm_kubernetes_cluster.aks[0].kube_config_raw
  value = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config_raw]
  sensitive   = true
}


// Configure K8s local client tools
# output "aks_config" {
#   value = <<CONFIGURE
# Run the following commands to configure kubernetes clients:
# $ terraform output aks_kube_config_raw > ~/.kube/aksconfig
# $ export KUBECONFIG=~/.kube/aksconfig
# CONFIGURE

# }

output "appgw_user_assigned_identity_id" {
  description = "appgw_user_assigned_identity_id"
  # value       = azurerm_kubernetes_cluster.aks[0].kube_config_raw
  value = [for instance in azurerm_user_assigned_identity.appgw_user_assigned_identity : instance.id]
}
output "appgw_user_assigned_identity_client_id" {
  description = "appgw_user_assigned_identity_client_id"
  # value       = azurerm_kubernetes_cluster.aks[0].kube_config_raw
  value = [for instance in azurerm_user_assigned_identity.appgw_user_assigned_identity : instance.client_id]
}
output "appgw_user_assigned_identity_principal_id" {
  description = "appgw_user_assigned_identity_principal_id"
  # value       = azurerm_kubernetes_cluster.aks[0].kube_config_raw
  value = [for instance in azurerm_user_assigned_identity.appgw_user_assigned_identity : instance.principal_id]
}
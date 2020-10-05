# =========================================================
# Common - variables
# =========================================================
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}

// variables needed to recombine target resources names
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project short name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

# ==============================================================================
# Key Vault infra - Variables 
# ==============================================================================
variable "akv_infra_id" {
  type        = string
  description = "KeyVault Infra ID."
}
# variable "resource_deploy_akv_infra" {
#   type = bool
#   default = true
# }
# variable "akv_infra_sku_name" {
#   type = string
#   description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
#   default = "standard"
# }
# variable "akv_infra_resource_index" {
#   type        = string
#   description = "Resource index for the KeyVault"
# }
 
# variable "akv_infra_enabled_for_disk_encryption" {
#   type        = bool
#   description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
#   default     = true
# }
# variable "akv_infra_soft_delete_enabled" {
#   type        = bool
#   description = "(Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false."
#   default     = true
# }
# variable "akv_infra_purge_protection_enabled" {
#   type        = bool
#   description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
#   default     = false
# }
 
# =======================================================
# Adds access policy to CCE AAD Group and TGITS DEF GROUP
# =======================================================
# variable "akv_infra_access_policy_security_level" {
#   type = string
#   description = "(Required) It will be : Owner, Contributor or Reader"
# }
# variable "akv_infra_access_policy_object_ids" {
#   type        = list(string)
#   description = "(Required) The list of object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
# }

# ==============================================================================
# AKS vnet - Variables
# ==============================================================================
variable "aks_resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aks_avnet_address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}
variable "aks_ddos_protection_plan" {
  type = object({
    id     = string
    enable = bool
  })
  default = null
}
variable "aks_avnet_dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers."
  default     = []
}

# =========================================================
# aks_kube_subnet
# =========================================================
variable "aks_kube_subnet_address_prefix" {
  type        = list(string)
  description = "(Required) The address prefix to use for the subnet."
  default     = []
}
# variable "aks_kube_subnet_address_prefix" {
#   type        = string
#   description = "(Required) The address prefix to use for the subnet."
#   default     = ""
# }
variable "aks_kube_subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}
variable "aks_kube_subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}
variable "aks_kube_subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}
# variable "aks_kube_delegations" {
#   description = "(Optional) One or more delegation blocks as defined below."
#   type = list(object({
#     name = string
#     service_delegation = object({
#       name    = string
#       actions = list(string)
#     })

#   }))
#   default = []
# }

# =========================================================
# aks_apim_subnet - Variables
# =========================================================
variable "aks_apim_subnet_address_prefix" {
  type        = list(string)
  description = "(Required) The address prefix to use for the subnet."
  default     = []
}
# variable "aks_apim_subnet_address_prefix" {
#   type        = string
#   description = "(Required) The address prefix to use for the subnet."
#   default     = ""
# }
variable "aks_apim_subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}
variable "aks_apim_subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}
variable "aks_apim_subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}
# variable "aks_apim_kube_delegations" {
#   description = "(Optional) One or more delegation blocks as defined below."
#   type = list(object({
#     name = string
#     service_delegation = object({
#       name    = string
#       actions = list(string)
#     })

#   }))
#   default = []
# }

# =========================================================
# aks_appgw_subnet - Variables
# =========================================================
variable "aks_appgw_subnet_address_prefix" {
  type        = list(string)
  description = "(Required) The address prefix to use for the subnet."
  default     = []
}
# variable "aks_appgw_subnet_address_prefix" {
#   type        = string
#   description = "(Required) The address prefix to use for the subnet."
#   default     = ""
# }
variable "aks_appgw_subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}
variable "aks_appgw_subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}
variable "aks_appgw_subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}
# variable "aks_apim_kube_delegations" {
#   description = "(Optional) One or more delegation blocks as defined below."
#   type = list(object({
#     name = string
#     service_delegation = object({
#       name    = string
#       actions = list(string)
#     })

#   }))
#   default = []
# }

# ==================================================================================
# Azure Public IP - Variables
# ==================================================================================
variable "appgw_frontend_public_ip_resource_index" {
  type        = string
  description = "Resource index for the application gateway frontend public ip"
}
variable "apip_sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Standard"
}
variable "apip_allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}
variable "apip_ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, IPv6 or IPv4."
  default     = "IPv4"
}
# variable "apip_domain_name_label" {
#   type        = string
#   description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
# }
variable "apip_reverse_fqdn" {
  type        = string
  description = "Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN."
}
# variable "apip_public_ip_prefix_id" {
#   type        = string
#   description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource."
# }
variable "apip_zones" {
  type        = list(number)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in."
}
variable "apip_idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  default     = 30
}

# ==============================================================================
# App GW User Assigned Identity - Variables
# ==============================================================================
# variable "appgw_userassignedidentity_resource_index" {
#   type        = string
#   description = "Resource index for the application gateway user assigned identity"
# }

# ==============================================================================
# Private Dns Zone - Variables
# ==============================================================================
variable "private_dns_zone_name" {
  type        = string 
  description = "(Required) The name of the Private DNS Zone. Must be a valid domain name."
}

# ==============================================================================
# APIM - Variables
# ==============================================================================
variable "apim_publisher_email" {
  type        = string
  description = "(Required) The email of publisher/company."
}
variable "apim_sku_name" {
  type        = string
  description = "(Required) sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
}
# variable "apim_identity_ids" {
#   type        = string
#   description = "(Optional) A list of IDs for User Assigned Managed Identity resources to be assigned."
# }
# variable "apim_vnet_type" {
#   type        = string
#   description = ""  
# }
# variable "apim_vnet_configuration_subnet_id" {
#   type        = string
#   description = "(Required) The subnetID that will be used for the APIM."  
# }

# ==============================================================================
# Application Gateway - Variables
# ==============================================================================
variable "appgw_sku_name" {
  type        = string
  description = "(Required) The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
}
variable "appgw_sku_tier" {
  type        = string
  description = "(Required) The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
}
variable "appgw_autoscale_configuration_min_capacity" {
  type        = string
  description = "(Required) Minimum capacity for autoscaling. Accepted values are in the range 0 to 100."
  default     = 2
}
variable "appgw_autoscale_configuration_max_capacity" {
  type        = string
  description = "(Optional) Maximum capacity for autoscaling. Accepted values are in the range 2 to 125."
  default     = 10
}
# variable "appgw_gateway_ip_configuration_subnet_id" {
#   type        = string
#   description = "(Required) The ID of a Subnet."
# }
# variable "appgw_frontend_ip_configuration_public_ip_address_id" {
#   type        = string
#   description = "(Optional) The ID of a Public IP Address which the Application Gateway should use."
# }
variable "appgw_backend_address_pool_ip_addresses" {
  type        = list(string)
  description = "(Optional) A list of IP Addresses which should be part of the Backend Address Pool."
}
variable "appgw_ssl_certificate_name" {
  type        = string
  description = "(Required) The Name of the SSL certificate that is unique within this Application Gateway"
}
# variable "ssl_certificate_akv_secret_id" {
#   type        = string
#   description = "(Optional) Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. You need to enable soft delete for keyvault to use this feature. Required if data is not set."
# } 
# variable "appgw_identity_ids" {
#   type        = list(string)
#   description = "(Required) Specifies a list with a single user managed identity id to be assigned to the Application Gateway."
# }
variable "appgw_target_domain_name" {
  type        = string 
  description = "Target domain name."
}

// tmp map object used to manbaged dynamic blocks  : TO BE TESTED for a new (target) feature in the target
# variable "http_listener" {
#   description = "(Required) One or more http_listener blocks as defined."
#   type = object({
#     name                           = string
#     frontend_ip_configuration_name = string
#     frontend_port_name             = string
#     protocol                       = string
#     host_name                      = string
#     require_sni                    = bool
#     ssl_certificate_name           = string
#   })
# }
# variable "request_routing_rule" {
#   description = "(Required) One or more request_routing_rule blocks as defined."
#   type = object({
#     name                       = string
#     rule_type                  = string
#     http_listener_name         = string
#     backend_address_pool_name  = string
#     backend_http_settings_name = string
#   })
# }
# variable "backend_http_settings" {
#   description = "(Required) One or more backend_http_settings blocks as defined."
#   type = object({
#     name                  = string
#     cookie_based_affinity = string
#     path                  = string
#     port                  = number
#     protocol              = string
#     request_timeout       = number
#   })
#   default = null
# }

# variable "probe" {
#   description = "(Optional) One or more probe blocks as defined."
#   type = object({
#     host                                      = string
#     interval                                  = number
#     name                                      = string
#     protocol                                  = string
#     path                                      = string
#     timeout                                   = number
#     unhealthy_threshold                       = number
#     pick_host_name_from_backend_http_settings = bool
#     minimum_servers                           = number
#   })
# }
# variable "identity" {
#   description = "(Optional) A identity block."
#   type = object({
#     identity_ids = list(string)
#     type         = string
#   })
# }
# variable "match" {
#   description = "(Optional) A match block as defined"
#   type = object({
#     body        = string
#     status_code = list(string)
#   })
# }

# ======================================================
# AKS Cluster - Variables
# ======================================================
variable "aks_dns_prefix" {
  type        = string
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  default     = "aks-dns"
}
variable "aks_version" {
  type        = string
  description = "(Optional) The version of kubernetes."
  default     = "1.16.7" // "1.14.8" 
}
variable "aks_agent_count" {
  type        = number
  description = "The number of agent nodes for the cluster."
  default     = 3
}
variable "aks_agent_vm_size" {
  type        = string
  description = "The size of the Virtual Machine."
  default     = "Standard_D3_v2"
}
variable "aks_agent_os_disk_size" {
  type        = number
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}
variable "aks_service_cidr" {
  type        = string
  description = "A CIDR notation IP range from which to assign service cluster IPs."
  default     = "10.0.0.0/16"
}
variable "aks_dns_service_ip" {
  type        = string
  description = "Containers DNS server IP address."
  default     = "10.0.0.10"
}
variable "aks_docker_bridge_cidr" {
  type        = string
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}
variable "aks_addon_profile" {
  description = "(Optional) AddOn Profile block."
  default = {
    # oms_agent_enabled                = false # Enable Container Monitoring
    http_application_routing_enabled = false # Enable HTTP Application Routing (Best practice : should never be enbable in prod)
    kube_dashboard_enabled           = false # Enable Kubernetes Dashboard
  }
}

# ==============================================================================
# ACR - Variables
# ==============================================================================
variable "resource_deploy_acr" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# variable "acr_name" {
#   type        = string
#   description = "(Required) Specifies the name of the Container Registry. Changing this forces a new resource to be created."
# }
variable "acr_sku" {
  type        = string
  description = "(Optional) The SKU name of the container registry."
}
variable "acr_admin_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
}
# variable "acr_ip_rule" {
#   type = object({
#     action   = string   // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
#     ip_range = string   // (Required) The CIDR block from which requests will match the rule.
#   })
#   default = null
# }
# variable "acr_vnet" {
#   type = object({
#     action   = string   // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
#     ip_range = string   // (Required) The subnet id from which requests will match the rule.
#   })
#   default = null
# }


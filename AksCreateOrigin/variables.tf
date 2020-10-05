# ==================================================================================
# AKS Create - Variables
# ==================================================================================
# =========================================================
# Common - variables
# =========================================================
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}
# variable "resource_depends_on" {
#   type        = any
#   default     = null
# }
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
# variable "location_code" {
#   type        = string
#   description = "Location code for the resource"
#   default     = "ne"
# }

# **************************************************************************
# AKS Vnet Integration - Variables
# **************************************************************************
# =================================================
# azurerm_virtual_network - variables
# =================================================
variable "aks_advanced_networking_enabled" {
  type        = bool
  description = "(Optional) Should this VNET be created ? Default to true"
  default     = true
}
# variable "aks_vnet_name" {
#   type        = string
#   description = "(Required) The name of the VNET. Changing this forces a new resource to be created."
# }
variable "aks_vnet_address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the VNET. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["17.0.0.0/23"]
}
# variable "aks_vnet_dns_servers" {
#   type        = list(string)
#   description = "(Optional) List of DNS Servers configured in the VNET. You can supply more than one address space."
#   default     = null
# }
variable "aks_vnet_subnets" {
  type = list(object({
    name           = string,
    address_prefix = string,
    security_group = bool
  }))
  description = "(Optional) Creates the subnets in the VNET"
  default     = []
}
variable "aks_subnet_docker_cidr" {
  type        = string
  description = "Aks subnet docker cidr"
  default     = "16.0.0.0/24"
}
variable "appgw_subnet_cidr" {
  type        = string
  description = "Application gateway subnet cidr"
  default     = "16.0.1.16/28"
}
variable "apim_subnet_cidr" {
  type        = string
  description = "API Management subnet CIDR"
  default     = "17.0.1.32/29"
} 

# variable "sp_aks_internal_id" {
#   type        = string
#   description = "The SP AKS internal ID."
# }
# variable "aks_service_principal_object_id" {
#   description = "Object ID of the service principal."
# }
# =================================================
# azurerm_network_ddos_protection_plan - variables
# =================================================
variable "aks_vnet_ddos_enabled" {
  type        = bool
  description = "(Optional) Adds a DDOS protection on the VNET. False by default. ddos protection is not a free service."
  default     = false
}
variable "aks_vnet_ddos_id" {
  type        = string
  description = "(Optional) Indicates the DDOS service to use. If no DDOS is specified, the module will create one."
  default     = null
}

# =================================================
# aks_vnet_nsg - variables
# =================================================
# variable "aks_vnet_nsg_enabled" {
#   type        = bool
#   description = "(Optional) Adds NSG to the VNET."
#   default     = false
# }


# ==================================================================================
# App Gateway - Variables
# ==================================================================================

// App Gateway - main vars
variable "aks_app_gw_sku" {
  type        = string
  description = "(Required) The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2"
  default     = "WAF_v2" // default value for CCE Team
}
variable "aks_app_gw_tier" {
  type        = string
  description = "(Required) The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  default     = "WAF_V2" // default value for CCE Team
}
# variable "aks_app_gw_autoscale_config_min_capacity" {
#   type        = number
#   description = "(Required) Minimum capacity for autoscaling. Accepted values are in the range 0 to 100."
#   default     = 2
# }
# variable "aks_app_gw_autoscale_config_max_capacity" {
#   type        = number
#   description = "(Optional) Maximum capacity for autoscaling. Accepted values are in the range 2 to 125."
#   default     = 10
# }
# optional unmanaged attribute
# variable "aks_app_gw_identity_ids" {
#   type        = list(string)
#   description = ""
# }

// App Gateway - WAF Configuration
# # variable "aks_app_gw_waf_config_enabled" {
# #   type        = bool
# #   description = "(Required) Is the Web Application Firewall be enabled?"
# #   default     = true
# # }
# variable "aks_app_gw_waf_config_firewall_mode" {
#   type        = string
#   description = "(Required) The Web Application Firewall Mode. Possible values are Detection and Prevention."
#   default     = "Prevention"
# }
# variable "aks_app_gw_waf_config_rule_set_type" {
#   type        = string
#   description = "(Required) The Type of the Rule Set used for this Web Application Firewall."
#   default     =  "OWASP"
# }
# variable "aks_app_gw_waf_config_rule_set_version" {
#   type        = string
#   description = "(Required) The Version of the Rule Set used for this Web Application Firewall. Possible values are 2.2.9, 3.0, and 3.1."
#   default     = "3.0"
# }
# variable "aks_app_gw_waf_config_file_upload_limit_mb" {
#   type        = number
#   description = "(Optional) The File Upload Limit in MB. Accepted values are in the range 1MB to 500MB. Defaults to 100MB."
#   default     = 500
# }

// App Gateway - Gateway IP Configuration
# variable "aks_app_gw_gateway_ip_config_name" {
#   type        - string
#   description = "(Required) The Name of this Gateway IP Configuration"
# }

// App Gateway - Front End Port
variable "aks_app_gw_frontend_port" {
  type        = number
  description = " (Required) The port used for this Frontend Port."
  default     = 80
}

// App Gateway - Backend Http Settings
variable "aks_app_gw_backend_http_settings_cookie_based_affinity" {
  description = "(Required) Is Cookie-Based Affinity enabled? Possible values are Enabled and Disabled."
  default     = "Disabled"
}
# variable "aks_app_gw_backend_http_settings_port" {
#   type        = number
#   description = "(Required) The port which should be used for this Backend HTTP Settings Collection."
#   default     = 443
# }
// aks_app_gw_backend_http_protocol is hard coded to 443 in CCE team TF Code
# variable "aks_app_gw_backend_http_protocol" {
#   type        = string
#   description = "(Required) The Protocol which should be used. Possible values are Http and Https."
#   default     = "Https" 
# }
variable "aks_app_gw_backend_http_request_timeout" {
  type        = number
  description = "(Required) The request timeout in seconds, which must be between 1 and 86400 seconds."
  default     = 10
}

// App Gateway - Http Listener

// hard coded to 443 / Https
# variable "aks_app_gw_http_listener_protocol" {
#   type        = string
#   description = "(Required) The Protocol to use for this HTTP Listener. Possible values are Http and Https."
#   default     = "Https" // for the moment (to be changed to Https in the target)
# }

// App Gateway - Request Routing Rule

// hard coded to Basic in the module
# variable "aks_app_gw_request_routing_rule_type" {
#   type        = string
#   description = "(Required) The Type of Routing that should be used for this Rule. Possible values are Basic and PathBasedRouting."
#   default     = "Basic"
# }
# variable "aks_app_gw_enable_http2" {
#   type        = bool
#   description = "(Optional) Is HTTP2 enabled on the application gateway resource? Defaults to false."
#   default     = false
# }

# ==================================================================================
# Public IP - Variables
# ==================================================================================
variable "aks_appgw_public_ip_sku" {
  type        = string
  description = ""
  default     = "Standard"
}
variable "aks_appgw_public_ip_allocation_method" {
  type        = string
  description = ""
  default     = "Static"
}
# variable "aks_appgw_frontend_public_ip" {
#   type        = string
#   description = ""
# }


# **************************************************************************
# AKS Monitoring Requirements- Variables
# **************************************************************************

# ==========================================================
# LogAnalyticsWorkspace Variables
# ==========================================================
// log analytics workspace name is managed in locals vars
variable "law_sku_name" {
  type        = string
  description = "(Required) The SKU (pricing level) of the Log Analytics workspace"
  default     = "PerGB2018"
}
variable "law_retention_in_days" {
  type        = number
  description = "(Optional) The retention period for the logs in days"
  default     = 30
}

# ==========================================================
# LogAnalyticsSolution Variables
# ==========================================================
# variable "las_workspace_resource_id" {
#   description = "(Required) The id of the workspace created for Log Analytics. Changing this forces a new resource to be created."
# }
# variable "las_workspace_name" {
#   description = "(Required) The name of the workspace created for Log Analytics. Changing this forces a new resource to be created."
# }
# variable "las_solution_name" {
#   description = "(Required) The name of the Log Analytics Solution."
#   default     = "ContainerInsights"
# }
# variable "las_plan_publisher_name" {
#   description = "(Required) The plan publisher name of the Log Analytics Solution."
#   default     = "Microsoft"
# }
# variable "las_plan_product_name" {
#   description = "(Required) The plan product name of the Log Analytics Solution."
#   default     = "OMSGallery/ContainerInsights"
# }

// Enable diagnostics logs
// more info : https://docs.microsoft.com/en-us/azure/aks/view-master-logs#enable-diagnostics-logs
# variable "aks_diagnostics_logs_map" {
#   description = "(Optional) Send the logs generated by AKS master node to diagnostics"
#   default = {
#     log = [
#       #["Category name",  "Diagnostics Enabled", "Retention Enabled", Retention period] 
#       ["kube-apiserver", true, true, 30],
#       ["kube-controller-manager", true, true, 30],
#       ["kube-scheduler", true, true, 30],
#       ["kube-audit", true, true, 30],
#       ["cluster-autoscaler", true, true, 30]
#     ]
#     metric = [
#       ["AllMetrics", true, true, 30],
#     ]
#   }
# }

# variable "aks_diagnostics_map" {
#   description = "(Optional) Storage Account and Event Hub data for the AKS diagnostics"
#   default = {
#     log_analytics_workspace_id = null
#     asa_diagnostic_setting_id  = null
#     aeh_id                     = ""
#     aeh_name                   = null
#   }
# }

# ==============================================================================
# AKS Variables
# ==============================================================================
variable "deploy_aks" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; false is the default value"
  default     = false
}
# variable "aks_cluster_name" {
#   type        = string
#   description = "(Required) The name of the Managed Kubernetes Cluster to create."
# }
variable "aks_node_resource_group" {
  type        = string
  description = "(Optional) The name of the Resource Group where the the Kubernetes Nodes should exist."
  default     = null   // default name is used (value not set)
} 


# variable "aks_rbac_enabled" {
#   type        = bool
#   description = "Boolean to enable or disable role-based access control"
#   default     = false
# }

# variable "aks_rbac_aad_client_app_id" {
#   type        = string
#   description = "Client application id for AAD integration"
# }
# variable "aks_rbac_aad_server_app_id" {
#   type        = string
#   description = "Server application id for AAD integration"
# }
# variable "aks_rbac_aad_server_app_secret" {
#   description = "Server application secret for AAD integration"
#   type        = string
# }

# variable "aad_tenant_id" {
#   description = "AAD tenant id for AAD integration"
#   type        = string
# }


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
# variable "aks_admin_username" {
#   type        = string
#   description = "The username of the local administrator to be created on the Kubernetes cluster"
# }

// ========================================================================
// AKS NODE POOLS
// ========================================================================
// Agent Pool subnet
// By default, AKS clusters use kubenet, and a VNET + Subnet are created for you.
// --> default value = null
# variable "aks_agent_pools_vnet_subnet_id" {
#   description = "(Required) The ID of the Subnet where the Agents in the Pool should be provisioned."
#   default     = null 
# }
# variable "aks_agent_pools" {
#   description = "(Optional) List of agent_pools profile for multiple node pools"
#   type = list(object({
#     name                = string       // (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
#     node_count          = number       // (Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count
#     vm_size             = string       // (Required) The size of the Virtual Machine, such as Standard_DS2_v2
#     # os_type             = string       // (Required) The AKS Node Type can be Linux or Windows Server 2019
#     os_disk_size_gb     = number       // (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created.
#     type                = string       // possible value = AvailabilitySet or VirtualMachineScaleSets (Defaults to VirtualMachineScaleSets)
#     max_pods            = number       // (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created.
#     availability_zones  = list(number) // (Optional) A list of Availability Zones across which the Node Pool should be spread.
#     enable_auto_scaling = bool         // (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false.
#     min_count           = number       // (Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100.
#     max_count           = number       // (Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100
#   }))
#   default = [{
#     name                = "default"
#     node_count          = 1
#     vm_size             = "Standard_D2s_v3"
#     # os_type             = "Linux"      // Linux and Windows Server 2019 OS are supported. (Linux by default : it's a best practice for containers monitoring : more info https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-overview , https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-onboard) 
#     os_disk_size_gb     = 50
#     type                = "VirtualMachineScaleSets"
#     max_pods            = 30
#     availability_zones  = [1, 2, 3]
#     enable_auto_scaling = false
#     min_count           = 1
#     max_count           = 3
#   }]
# }



# variable "default_node_pool" {
#   description = "The object to configure the default node pool with number of worker nodes, worker node VM size and Availability Zones."
#   type = object({
#     name                = string       // (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
#     node_count          = number       // (Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count
#     vm_size             = string       // (Required) The size of the Virtual Machine, such as Standard_DS2_v2
#     # os_type             = string       // (Required) The AKS Node Type can be Linux or Windows Server 2019
#     os_disk_size_gb     = number       // (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created.
#     type                = string       // possible value = AvailabilitySet or VirtualMachineScaleSets (Defaults to VirtualMachineScaleSets)
#     max_pods            = number       // (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created.
#     availability_zones  = list(number) // (Optional) A list of Availability Zones across which the Node Pool should be spread.
#     cluster_auto_scaling = bool         // (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false.
#     min_count           = number       // (Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100.
#     cluster_auto_scaling_max_count           = number       // (Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100
#   })
#   default = {
#     name                = "default_node_pool1"
#     node_count          = 1
#     vm_size             = "Standard_D2s_v3"
#     # os_type             = "Linux"      // Linux and Windows Server 2019 OS are supported. (Linux by default : it's a best practice for containers monitoring : more info https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-overview , https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-onboard) 
#     node_os             =   
#     os_disk_size_gb     = 50
#     type                = "VirtualMachineScaleSets"
#     max_pods            = 30
#     availability_zones  = [1, 2, 3]
#     cluster_auto_scaling = false
#     min_count           = 1
#     max_count           = 3
#   }
# }


// FOR THE TARGET
# variable "default_node_pool" {
#   description = "The object to configure the default node pool with number of worker nodes, worker node VM size and Availability Zones."
#   type = object({
#     name                           = string
#     node_count                     = number
#     vm_size                        = string
#     zones                          = list(string)
#     taints                         = list(string)
#     cluster_auto_scaling           = bool
#     cluster_auto_scaling_min_count = number
#     cluster_auto_scaling_max_count = number
#   })
# }

// tmp for testing
variable "aks_agent_count" {
  description = "The number of agent nodes for the cluster."
  default     = 3
}

variable "aks_agent_vm_size" {
  description = "The size of the Virtual Machine."
  default     = "Standard_D3_v2"
}
variable "aks_agent_os_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}



# variable "additional_node_pools" {
#   description = "The map object to configure one or several additional node pools with number of worker nodes, worker node VM size and Availability Zones."
#   type = map(object({
#     name                  = string       // (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
#     node_count            = number       // (Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count
#     vm_size               = string       // (Required) The size of the Virtual Machine, such as Standard_DS2_v2
#     # os_type  s           = string      // (Required) The AKS Node Type can be Linux or Windows Server 2019
#     os_disk_size_gb       = number       // (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created.
#     type                  = string       // possible value = AvailabilitySet or VirtualMachineScaleSets (Defaults to VirtualMachineScaleSets)
#     max_pods              = number       // (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created.
#     availability_zones    = list(number) // (Optional) A list of Availability Zones across which the Node Pool should be spread.
#     max_count             = bool         // (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false.
#     min_count             = number       // (Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100.
#     max_count             = number       // (Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100
#     node_taints           = list(string)
#   }))
# }
# variable "additional_node_pools" {
#   description = "The map object to configure one or several additional node pools with number of worker nodes, worker node VM size and Availability Zones."
#   type = map(object({
#     node_count                     = number
#     vm_size                        = string
#     zones                          = list(string)
#     taints                         = list(string)
#     cluster_auto_scaling           = bool
#     cluster_auto_scaling_min_count = number
#     cluster_auto_scaling_max_count = number
#   }))
# }

# variable "aks_addon_profile" {
#   description = "(Optional) AddOn Profile block."
#   default = {
#     oms_agent_enabled                = false # Enable Container Monitoring
#     http_application_routing_enabled = false # Enable HTTP Application Routing (Best practice : should never be enbable in prod)
#     kube_dashboard_enabled           = false # Enable Kubernetes Dashboard
#   }
# }

# variable "aks_monitoring_log_analytics_workspace_id" {
#   description = "(Optional) The ID of the Log Analytics Workspace in which the OMS Agent should send data to."
#   default     = null
# }


// FOR THE TARGET
# variable "aks_network_profile" {
#   description = "(Optional) Implement network profile for Advanced Networking."
#   default = {
#     # Use azure-cni for more advanced networking
#     network_plugin     = "azure" // or kubenet // (Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created.
#     network_policy     = "azure" // or calico  // (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created.
#     dns_service_ip     = "10.100.0.10"         // (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
#     docker_bridge_cidr = "172.17.0.1/16"       // (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
#     outbound_type      = "loadBalancer"        // (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer.
#     pod_cidr           = null                  // (Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created.
#     service_cidr       = "10.100.0.0/16"       // (Optional) The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created. This range should not be used by any network element on or connected to this VNet. Service address CIDR must be smaller than /12.
#     load_balancer_sku  = "Standard"            // (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. Defaults to Standard.
#   }
# }

// FOR TMP TESTING
variable "aks_service_cidr" {
  description = "A CIDR notation IP range from which to assign service cluster IPs."
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "Containers DNS server IP address."
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

# variable "aks_service_principal" {
#   description = "(Required) The Service Principal to create aks cluster."
#   type = object({
#     client_id     = string
#     client_secret = string
#   })
# }

# variable "aks_sp_client_id" {
#   type        = string
#   description = "(Required) The Client ID for the Service Principal."
# }
# variable "aks_sp_secret" {
#   type        = string
#   description = ""
# }

# ==============================================================================
# APIM - Variables
# ==============================================================================
variable "apim_sku_name" {
  type        = string
  description = "The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1). The second part of the sku name is the apim capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}   
# variable "apim_capacity" {
#   type        = number
#   description = "The second part of the sku name is the apim capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
#   default     = 1
# } 
variable "apim_subnet_ip_address" {
  type = string
  description = "backend_address_pool block of the appgw : private ip adress used in the to choose in the CIDR range of the apim subnet."
}


# ==============================================================================
# DNS Cname Record - variables
# ==============================================================================
# variable "cname_dns_zone" {
#   type        = string
#   default     = "azr.tgscloud.net"
#   description = "(Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created."
# }
# variable "cname_name" {
#   type        = string
#   description = "(Required) The name of the DNS CNAME Record."
# }
# variable "cname_record" {
#   type        = string
#   description = "(Required) The target of the CNAME."
# }


# ==============================================================================
# Keyvault Infra - Variable
# ==============================================================================
# variable "resource_deploy_akv_infra" {
#   type        = bool
#   description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
#   default     = true
# }
# variable "sku_key_vault_infra" {
#   type        = string
#   description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium. This KV contains all secrets needed to make working the CCE Azure Devops pipelines (Orchestrator)"
# }

# variable "resource_index" {
#   type        = string
#   description = "Resource index for the KeyVault"
# }
# variable "akv_sku_name" {
#   type        = string
#   description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
# }
# variable "akv_access_policy_security_level" {
#   type        = string
#   description = "(Required) It will be : Owner, Writer or Reader"
#   default     = "Owner"
# }





# variable "akv_enabled_for_disk_encryption" {
#   type        = bool
#   description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
#   default     = true
# }
# variable "akv_soft_delete_enabled" {
#   type        = bool
#   description = "(Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false."
#   default     = true
# }
# variable "akv_purge_protection_enabled" {
#   type        = bool
#   description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
#   default     = true
# }
# variable "akv_enabled_for_deployment" {
#   type        = bool
#   description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
#   default     = false
# }
# variable "akv_enabled_for_template_deployment" {
#   type        = string
#   description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
#   default     = false
# }
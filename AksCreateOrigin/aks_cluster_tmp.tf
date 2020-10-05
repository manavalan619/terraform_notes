resource "azurerm_kubernetes_cluster" "aks" {
  count                   = var.deploy_aks ? 1 : 0
  # count = 1
  name                    = local.aks_cluster_target_name
  location                = data.azurerm_resource_group.project_resource_group.location
  resource_group_name     = data.azurerm_resource_group.project_resource_group.name
  dns_prefix              = var.aks_dns_prefix
  # private_cluster_enabled = false

  kubernetes_version      = var.aks_version // var.aks_version != "" ? var.aks_version : data.azurerm_kubernetes_service_versions.current.latest_version
 
  // RBAC enabled
  role_based_access_control {
    enabled = true // var.aks_rbac_enabled
  
    azure_active_directory {
       client_app_id      = data.azurerm_key_vault_secret.aks-aad-client-app-id.value   // "84e197e8-e5cc-4bc3-88ed-2620143a9891"   // var.aks_rbac_aad_client_app_id                // output from module.AksAadInetgration.aks_aad_client_app_application_id
       server_app_id      = data.azurerm_key_vault_secret.aks-aad-server-app-id.value   // "c1f7a933-dc4f-4b42-88db-5f15f8f4d32d" // data.azurerm_key_vault_secret.aks-aad-server-app-id.value  // var.aks_rbac_aad_server_app_id                // output from module.AksAadInetgration.aks_aad_server_app_application_id
       server_app_secret  = data.azurerm_key_vault_secret.aks-aad-server-app-psw.value  // "aG.jNKbEHT@@D.z13pkm1Res1]ErcHZw" // "aksserver" // data.azurerm_key_vault_secret.aks-aad-server-app-psw.value // var.aks_rbac_aad_server_app_secret            // output from module.AksAadInetgration.sp_aad_server_app_password
       tenant_id          = data.azurerm_client_config.current.tenant_id                // "cc251925-4d3d-43c3-808e-774f6ff0366b" // 
    }
  }

  linux_profile {
    admin_username = local.aks_admin_target_username

    ssh_key {
      # Public SSH Key used to access the AKS cluster. (Force to remove any new lines)
      key_data = trimspace(replace(tls_private_key.aks_ssh_key[0].public_key_openssh, "\n", ""))
      # key_data = trimspace(replace(var.aks_admin_public_key_openssh, "\n", ""))
    }
  }

 // addon_profile for testing
  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

 // addon_profile for the target
  # addon_profile {
  #   # http_application_routing {
  #   #   enabled = false // simple conf to test
  #   # }
  #     // http application routing
  #   dynamic "http_application_routing" {
  #     for_each = lookup(var.aks_addon_profile, "http_application_routing_enabled", false) == true ? [1] : []
  #     content {
  #       enabled = var.aks_addon_profile.http_application_routing_enabled
  #     }
  #   }
  #   // oms_agent block to enable Azure Monitor for containers
  #   dynamic "oms_agent" {
  #     for_each = lookup(var.aks_addon_profile, "oms_agent_enabled", false) == true ? [1] : []
  #     content {
  #       enabled                    = var.aks_addon_profile.oms_agent_enabled
  #       log_analytics_workspace_id = module.aks_law.law_id //var.aks_monitoring_log_analytics_workspace_id
  #     }
  #   }
  #   // aks kube dashboard
  #   dynamic "kube_dashboard" {
  #     for_each = lookup(var.aks_addon_profile, "kube_dashboard_enabled", false) == true ? [1] : []
  #     content {
  #       enabled = var.aks_addon_profile.kube_dashboard_enabled
  #     }
  #   }
  # }

//default_node_pool for testing
  default_node_pool {
    name            = "agentpooltst"
    node_count      = var.aks_agent_count
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = azurerm_subnet.aks_subnet[0].id //data.azurerm_subnet.kubesubnet[0].id// data.azurerm_subnet.kubesubnet.id // azurerm_subnet.aks_subnet[0].id  
  }

  //default_node_pool for the target
#   default_node_pool {
#     vnet_subnet_id      = azurerm_subnet.aks_subnet[0].id
#     name                = substr(var.default_node_pool.name, 0, 12)
#     node_count          = var.default_node_pool.node_count
#     vm_size             = var.default_node_pool.vm_size
#     type                = "VirtualMachineScaleSets"
#     availability_zones  = var.default_node_pool.zones
#     max_pods            = 250
#     os_disk_size_gb     = 128
#     node_taints         = var.default_node_pool.taints
#     enable_auto_scaling = var.default_node_pool.cluster_auto_scaling
#     min_count           = var.default_node_pool.cluster_auto_scaling_min_count
#     max_count           = var.default_node_pool.cluster_auto_scaling_max_count
#  }  

  service_principal {
    client_id     = data.azurerm_key_vault_secret.aks-sp-client-id.value //  "35c27fcf-b6fc-4db1-b921-6f489addd4c3"  // var.aks_sp_client_id
    client_secret = data.azurerm_key_vault_secret.aks-sp-psw.value     // "=0oLnps<:OhA?x7J"     // data.azurerm_key_vault_secret.aks-sp-app-psw.value // var.aks_sp_secret
  }

  // **********************************************************************************
  // FOR THE TARGET : Deploy a private AKS cluster 
  // to ensure ensure that network traffic between your API server 
  // and your node pools remains on the private network only.)
  // Private AKS cluster limitations :
  // https://docs.microsoft.com/en-us/azure/aks/private-clusters#limitations
  // **********************************************************************************
  # dynamic "network_profile" {
  #   for_each = var.aks_network_profile  == "" ? [] : [1] // return empty list to for_each if var.aks_network_profile is empty
  #   content {
  #     network_plugin     = var.aks_network_profile.network_plugin
  #     network_policy     = var.aks_network_profile.network_policy
  #     service_cidr       = var.aks_network_profile.service_cidr
  #     dns_service_ip     = var.aks_network_profile.dns_service_ip
  #     docker_bridge_cidr = var.aks_network_profile.docker_bridge_cidr
  #     load_balancer_sku  = lookup(var.aks_network_profile, "load_balancer_sku", "basic") //basic if load_balancer_sku is not set
  #   }
  # }

  // FOR TMP TESTING
  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  tags = data.azurerm_resource_group.project_resource_group.tags

  # depends_on = [var.resource_depends_on] 
  depends_on = [azurerm_virtual_network.aks_vnet, azurerm_subnet.aks_subnet, azurerm_application_gateway.aks_app_gw  ]

}
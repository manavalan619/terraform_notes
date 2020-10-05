// TODO : config GIT (check orchestrator code ; pipelines ADO à voir)
// https://dev.azure.com/dataops-total/devops-transvers/_git/Infra?version=GBpoc&_a=contents
resource "azurerm_application_gateway" "aks_app_gw" {
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count               = var.deploy_aks ? 1 : 0
  name                = local.aks_app_gw_target_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  sku {
    name     = var.aks_app_gw_sku  // "WAF_v2" // Possible values = Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2
    tier     = var.aks_app_gw_tier // "WAF_v2" // Possible values = Standard, Standard_v2, WAF and WAF_v2.
    // capacity = 2
  }

  autoscale_configuration {
    min_capacity = 2  // var.aks_app_gw_autoscale_config_min_capacity  // (2 is harcoded for CCE team)   
    max_capacity = 10 // var.aks_app_gw_autoscale_config_max_capacity  // (10 is harcoded for CCE team)
  }

  waf_configuration {
    enabled              = true         // var.aks_app_gw_waf_config_enabled                // "true" is hard coded for CCE team
    firewall_mode        = "Prevention" // var.aks_app_gw_waf_config_firewall_mode          // "Prevention" is hard coded for CCE team
    rule_set_type        = "OWASP"      // var.aks_app_gw_waf_config_rule_set_type          // "OWASP" is hard coded for CCE team
    rule_set_version     = "3.0"        // var.aks_app_gw_waf_config_rule_set_version       // "3.0" is hard coded for CCE team
    file_upload_limit_mb = 500          // var.aks_app_gw_waf_config_file_upload_limit_mb   // 500 is hard coded for CCE team
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.appgw_subnet[0].id //azurerm_subnet.appgw_subnet[0].id //data.azurerm_subnet.appgwsubnet.id
  }

  # frontend_port {
  #   name = local.frontend_port_name
  #   port = 80
  # }

  frontend_port {
    name = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend-port"//local.frontend_port  // lower("app-gw-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-frontend-port") //"httpsPort"
    port = 443
  }

  frontend_ip_configuration {
    name                            = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend"// local.frontend_ip_configuration_name
    public_ip_address_id            = azurerm_public_ip.aks_app_gateway_frontend_public_ip[0].id
    private_ip_address_allocation   = "Dynamic"
  }

  // Http Listeners
  http_listener {
    name                            = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-listener"
    frontend_ip_configuration_name  = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend"
    frontend_port_name              = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend-port"
    protocol                        = "Https"
    host_name                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.azr.tgscloud.net"
    require_sni                     = true
    ssl_certificate_name            = "azrtgscloudnet" // data.azurerm_key_vault_secret.appgw_certificate.name // "azrtgscloudnet"
  }
  http_listener {
    name                           = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-listener"
    frontend_ip_configuration_name = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend"
    frontend_port_name             = "${lower(var.short_project_name)}-${lower(var.env_code)}-frontend-port"
    protocol                       = "Https"
    host_name                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.azr.tgscloud.net"
    require_sni                    = true
    ssl_certificate_name           = "azrtgscloudnet" // data.azurerm_key_vault_secret.appgw_certificate.name // "azrtgscloudnet" (wildcard certificate for in ordre to test TLS)
  }

 // request_routing_rules 
 // They are not path based rules for the moment (TODO : study if path based rule is needed for the target)
 request_routing_rule {
  backend_address_pool_name  = "${lower(var.short_project_name)}-${lower(var.env_code)}-api"
  backend_http_settings_name = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-http_setting"
  http_listener_name         = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-listener"
  name                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-rule"
  rule_type                  = "Basic"
 }
 request_routing_rule {
  backend_address_pool_name  = "${lower(var.short_project_name)}-${lower(var.env_code)}-api"
  backend_http_settings_name = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-http_setting"
  http_listener_name         = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-listener"
  name                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-rule"
  rule_type                  = "Basic"
 }

  backend_address_pool {
    name         = "${lower(var.short_project_name)}-${lower(var.env_code)}-api" //local.backend_address_pool_name
    ip_addresses = [var.apim_subnet_ip_address]  // private ip adress to choose in the CIDR range of the apim subnet
  }


  backend_http_settings {
    name                  = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-http_setting"
    cookie_based_affinity = "Disabled"
    port                  = 443
    probe_name            = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-probe" 
    protocol              = "Https"
    request_timeout       = 10
  }
  backend_http_settings {
    name                  = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-http_setting"
    cookie_based_affinity = "Disabled"
    port                  = 443
    probe_name            = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-probe" 
    protocol              = "Https"
    request_timeout       = 10
  }
  probe {
    # host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.${var.dns_zone}"
    host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.azr.tgscloud.net"
    interval                                  = 30 
    minimum_servers                           = 0 
    name                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy-probe"
    path                                      = "/status-0123456789abcdef" // default health endpoint hosted on all the API Management services
    pick_host_name_from_backend_http_settings = false 
    protocol                                  = "Https" 
    timeout                                   = 30 
    unhealthy_threshold                       = 3 

    match {
        body = ""
        status_code = [
            "200-399",
        ] 
    }
  }
  probe {
      # host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.${var.dns_zone}" 
      host                                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.azr.tgscloud.net"
      interval                                  = 30 
      minimum_servers                           = 0 
      name                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal-probe"
      path                                      = "/signin" 
      pick_host_name_from_backend_http_settings = false 
      protocol                                  = "Https"
      timeout                                   = 30 
      unhealthy_threshold                       = 3 

      match {
          body = ""
          status_code = [
              "200-399",
          ] 
      }
  }
 
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.appgw_user_assigned_identity[0].id] 
  }

  ssl_certificate {
    name                = "azrtgscloudnet" // data.azurerm_key_vault_secret.appgw_certificate.name     // " "
    #data = "${filebase64("/home/mathieu/devops_INFRA/LocalTest/modules/01-create-env/my1.pfx")}"
    # data          = "${var.base64Cert}"
    # password      = ""  // password = "9f9LodH2H>(c)M<t"
    key_vault_secret_id = data.azurerm_key_vault_secret.appgw_certificate.id  
  }

    # ssl_certificate {
    #   name     = "certificate"
    #   data     = "${base64encode(file("mycert.pfx"))}"
    #   password = "XXXXXXX"
    # }

  // for the target, we need to setup the trusted root ca certificate with the project one.
  # trusted_root_certificate {
  #   data = filebase64(var.trusted_root_certificate_path)
  #   name = "demo-trusted-root-ca-certificate"
  # }

  tags       = data.azurerm_resource_group.project_resource_group.tags

  depends_on = [azurerm_virtual_network.aks_vnet, azurerm_subnet.appgw_subnet, azurerm_public_ip.aks_app_gateway_frontend_public_ip,azurerm_user_assigned_identity.appgw_user_assigned_identity]
}

# =============================================================================================
# Role Assigments
# =============================================================================================

# AKS User Assigned Identity on project RG
resource "azurerm_user_assigned_identity" "aks_user_assigned_identity" {
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count               = var.deploy_aks ? 1 : 0
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  name = lower("aks-user-identity-${lower(var.short_project_name)}-${lower(var.env_code)}")

  tags = data.azurerm_resource_group.project_resource_group.tags
}


# AppGW User Assigned Identity on project RG
resource "azurerm_user_assigned_identity" "appgw_user_assigned_identity" {
  # count               = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count               = var.deploy_aks ? 1 : 0
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  name = "app-gw-user-identity-${lower(var.short_project_name)}-${lower(var.env_code)}"

  tags = data.azurerm_resource_group.project_resource_group.tags
}




// reference aks subnet and application gateway subnet for further manipulations
# data "azurerm_subnet" "kubesubnet" {
#   # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
#   name                 = local.aks_subnet_target_name 
#   virtual_network_name = local.aks_vnet_target_name // azurerm_virtual_network.aks_vnet[0].name
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
# } 
# data "azurerm_subnet" "appgwsubnet" {
#   # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
#   name                 = local.aks_app_gw_subnet_target_name
#   virtual_network_name = local.aks_vnet_target_name // azurerm_virtual_network.aks_vnet[0].name
#   resource_group_name  = data.azurerm_resource_group.project_resource_group.name
# }

// Assign "Network Contributor" Role to SP AKS on aks subnet
resource "azurerm_role_assignment" "ra1" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count                = var.deploy_aks ? 1 : 0
  scope                = azurerm_subnet.aks_subnet[0].id // data.azurerm_subnet.kubesubnet.0.id
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_key_vault_secret.aks-sp-internal-id.value //  "d4d6c997-710c-420e-8395-8b6f6c5d2409" // "fce4566d-f06d-45ab-a746-b1ae64d4d7d0" // data.azurerm_key_vault_secret.aks-sp-client-id.value // data.azurerm_key_vault_secret.aks-sp-client-id.value // var.aks_service_principal_object_id 
  depends_on = [azurerm_virtual_network.aks_vnet, azurerm_subnet.aks_subnet]  
}
  
// Assign "Managed Identity Operator" Role to SP AKS on user assign identity
resource "azurerm_role_assignment" "ra2" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count                = var.deploy_aks ? 1 : 0
  scope                = azurerm_user_assigned_identity.aks_user_assigned_identity[0].id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_key_vault_secret.aks-sp-internal-id.value // "d4d6c997-710c-420e-8395-8b6f6c5d2409" // "fce4566d-f06d-45ab-a746-b1ae64d4d7d0" // data.azurerm_key_vault_secret.aks-sp-client-id.value // data.azurerm_key_vault_secret.aks-sp-client-id.value // var.aks_service_principal_object_id
  depends_on           = [azurerm_user_assigned_identity.aks_user_assigned_identity] 
}

// Assign "Contributor" Role to SP AKS on app gateway
resource "azurerm_role_assignment" "ra3" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count                = var.deploy_aks ? 1 : 0
  scope                = azurerm_application_gateway.aks_app_gw[0].id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_user_assigned_identity[0].principal_id // var.aks_service_principal_object_id 
  depends_on           = [azurerm_user_assigned_identity.aks_user_assigned_identity, azurerm_application_gateway.aks_app_gw] 
}

// Assign Reader Role to to SP AKS on Project Resource Group
resource "azurerm_role_assignment" "ra4" {
  # count                = var.deploy_aks && var.aks_advanced_networking_enabled ? 1 : 0
  # count = 1
  count                = var.deploy_aks ? 1 : 0
  scope                = data.azurerm_resource_group.project_resource_group.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.aks_user_assigned_identity[0].principal_id // var.aks_service_principal_object_id 
  depends_on           = [azurerm_user_assigned_identity.aks_user_assigned_identity, azurerm_application_gateway.aks_app_gw] 
}

# ====================================================================================
# Adds access policy Reader to kv-total-it-aksmgt for the AppGw UserAssigned Identity
# The AppGw UserAssigned Identity must have read access on wildcard certificate
# ====================================================================================
# module "add_access_policy_to_appgwIdentity_on_akv_total_it_aksmgt" {
#   source                            = "../KeyVaultAccessPolicy/"
#   provider                          = azurerm.subscription_total_it
#   # akv_access_policy_key_vault_id    =   var.resource_deploy ? azurerm_key_vault.akv[0].id : ""
#   akv_access_policy_key_vault_id    = "/subscriptions/8926a4c9-f728-4c15-8df3-92c580ea6008/resourceGroups/RG-TOTAL-WE-IT-AKSMGT/providers/Microsoft.KeyVault/vaults/kv-total-it-aksmgt"
#   # akv_access_policy_object_ids      = [azurerm_user_assigned_identity.appgw_user_assigned_identity[0].id]
#   akv_access_policy_object_ids      = [azurerm_user_assigned_identity.appgw_user_assigned_identity[0].principal_id]
#   akv_access_policy_security_level  = "Reader"
# }

// ou mettre membre l'AppGw UserAssigned Identity dans le group aad "ZG-AZR-TGS-DEF-P-READER" ?

# ========================================================================================
# Adds AppGw UserAssigned Identity as a member of aad group ZG-AZR-TGS-CERT-READER
# "ZG-AZR-TGS-CERT-READER" group has get/list access permission on AKV kv-total-it-aksmgt
# AKV "kv-total-it-aksmgt" is managed by CCE and stored the wildcard certificate
# used in appgw ssl_cetificate block and http_listerners blocks
# ========================================================================================
# resource azuread_group_member"" "Add_ReadAccess_appww_userAssignedIdentity_to_kv-total-it-aksmgt" {
#   group_object_id   = "2453f06e-19c3-4aa3-89e9-13c2e6614dd6" // ZG-AZR-TGS-CERT-READER : objectId = 2453f06e-19c3-4aa3-89e9-13c2e6614dd6
#   member_object_id  = azurerm_user_assigned_identity.appgw_user_assigned_identity[0].client_id  

# // ne fonctionne pas : member_object_id  = azurerm_user_assigned_identity.appgw_user_assigned_identity[0].id 
# // ne fonctionne pas : azurerm_user_assigned_identity.appgw_user_assigned_identity[0].principal_id
# // a tester demain   : member_object_id  =  azurerm_user_assigned_identity.appgw_user_assigned_identity[0].client_id 
#  depends_on = [azurerm_user_assigned_identity.appgw_user_assigned_identity]
# }

# resource "azuread_group" "r5" {
#   name    = "ZG-AZR-TGS-CERT-READER"
#   members = [azurerm_user_assigned_identity.appgw_user_assigned_identity[0].client_id]
#   depends_on = [azurerm_user_assigned_identity.appgw_user_assigned_identity]
# }

# resource "null_resource" "AddAppGwUserIdentityToZG-AZR-TGS-CERT-READER"  {
#   # triggers = {
#   #   adb_token_trigger = "${var.resource_deploy}"
#   # }
#   provisioner "local-exec" {
#     command = "pwsh -File ${path.module}/script/add_appwg_user_identity_to_aad_group.ps1 -AppgwUserAssignedIdentity ${local.appgw_user_assigned_identity_target_name} -AadTargetGroup ${"ZG-AZR-TGS-CERT-READER"}  -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -Resourcegroup ${data.azurerm_resource_group.project_resource_group.name} -SubscriptionId ${data.azurerm_client_config.current.subscription_id}"
#   }
#   depends_on = [azurerm_user_assigned_identity.appgw_user_assigned_identity]
# }
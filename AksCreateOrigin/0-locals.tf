# ========================================================================
# Data sources
# ========================================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# retreive static suffix secret value
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name 
  resource_group_name = local.rg_tf_name 
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# retreive aks-aad-client-app-id secret value
data "azurerm_key_vault_secret" "aks-aad-client-app-id" {
  name         = "aks-aad-client-app-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-aad-client-app-id.value

# retreive aks-aad-server-app-id secret value
data "azurerm_key_vault_secret" "aks-aad-server-app-id" {
  name         = "aks-aad-server-app-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-aad-server-app-id.value

# retreive aks-aad-server-app-psw secret value
data "azurerm_key_vault_secret" "aks-aad-server-app-psw" {
  name         = "aks-aad-server-app-psw"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-aad-server-app-psw.value

# retreive aks-sp-client-id secret value
data "azurerm_key_vault_secret" "aks-sp-client-id" {
  name         = "aks-sp-client-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-sp-client-id.value

# retreive aks-sp-app-psw secret value
# data "azurerm_key_vault_secret" "aks-sp-app-psw" {
#   name         = "aks-sp-app-psw"
#   key_vault_id = data.azurerm_key_vault.akv_tf.id
# }
// data.azurerm_key_vault_secret.aks-sp-app-psw.value

# retreive aks-sp-psw secret value
data "azurerm_key_vault_secret" "aks-sp-psw" {
  name         = "aks-sp-psw"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-sp-psw.value

# retreive aks-sp-psw secret value
data "azurerm_key_vault_secret" "aks-sp-internal-id" {
  name         = "aks-sp-internal-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
// data.azurerm_key_vault_secret.aks-sp-internal-id.value

# used to retreive tenant_id (+ object_id the the sp terraform) from the current client config
data "azurerm_client_config" "current" {}

#retrieve the version of Kubernetes supported by Azure Kubernetes Service.
data "azurerm_kubernetes_service_versions" "current" {
  location = data.azurerm_resource_group.project_resource_group.location
}

# reference to KEYVAULT managed by CCE to store the wildcard certificate
# data "azurerm_key_vault" "keyvault_infra_cce" {
#   name                = lower("kv-total-it-aksmgt")        // kv-total-it-aksmgt
#   resource_group_name = upper("RG-TOTAL-WE-IT-AKSMGT")     // RG-TOTAL-WE-IT-AKSMGT
#   key_vault_id = "/subscriptions/8926a4c9-f728-4c15-8df3-92c580ea6008/resourceGroups/RG-TOTAL-WE-IT-AKSMGT/providers/Microsoft.KeyVault/vaults/kv-total-it-aksmgt"
# } 
# Retreive appgw_certificate in the key
data "azurerm_key_vault_secret" "appgw_certificate" {
  provider     = azurerm.subscription_total_it
  name         = "azrtgscloudnet"
  key_vault_id = "/subscriptions/8926a4c9-f728-4c15-8df3-92c580ea6008/resourceGroups/RG-TOTAL-WE-IT-AKSMGT/providers/Microsoft.KeyVault/vaults/kv-total-it-aksmgt"  //data.azurerm_key_vault.keyvault_infra_cce.id
}

# data "azurerm_key_vault_certificate" "appgw_certificate" {
#   provider     = azurerm.subscription_total_it
#   name         = "azrtgscloudnet"
#   key_vault_id = "/subscriptions/8926a4c9-f728-4c15-8df3-92c580ea6008/resourceGroups/RG-TOTAL-WE-IT-AKSMGT/providers/Microsoft.KeyVault/vaults/kv-total-it-aksmgt"  //data.azurerm_key_vault.keyvault_infra_cce.id
# }

// data.azurerm_key_vault_secret.appgw_certificate.value


data "azurerm_key_vault_secret" "client_secret" {
  name         = "ARM-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# ========================================================================
# Manage internal rules 
# ========================================================================
locals {
  // manage keyvault infra access policies (keyvault infra store secrets needed for cce ado pilelines (orchestrator) to work properly)
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib = "Contributor"
  reader  = "Reader"

 // AKV Infra naming convention
  akv_infra_target_name = lower("akv-infra-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")


  // TARGET AKS CLUSTER NAME (naming convention with static suffix)
  aks_cluster_target_name   = lower("aks-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  aks_admin_target_username = lower("aks-admin-${var.env_code}-${var.short_project_name}")
  // AKV MGT
  rg_tf_name                = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name               = lower("akv-tf-${var.env_code}-we-${var.project_name}")

  // ***************************************************
  // AKS VNET, SUBNETS, DDOS and NSG naming conventions
  // ***************************************************
  // (naming convention updated with static suffix included)

  // !!! BE CAREFULL TO VALIDATE THAT VNET RANGES DO NOT OVERLAP WITH OTHER VNETS RANGES !!!
  // BE CAREFULL WITH THE QUOTA OF THE MAX NUMBER OF VNET ON AZURE PER SUBSCRIPTIONS/REGION !
  // NETWORKING STRATEGY TO BEE DEFINED CONJOINTLY WITH CCE AND INOX TEAN
  // FOR THE MOMENT WE KEEP THE STANDARD NAPING CONVENTION ..(DONT KEEEP THAT, its create one vnet per project ..!)

  // aks_vnet & subnets
  aks_vnet_target_name          = lower("vnet-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  aks_subnet_target_name        = lower("kubesubnet")   // the  character "-"" is not authorized for a subnet name
  aks_app_gw_subnet_target_name = lower("appgwsubnet")
  aks_apim_subnet_target_name   = lower("apimsubnet")

  // aks_vnet_ddos
  aks_vnet_ddos_target_name  = lower("ddos-protect-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  // aks_vnet_ddos_plan 
  // (ddos protect plan is deployed only if aks_advanced_networking_enabled and aks_vnet_ddos_plan_enabled are set to True)
  aks_vnet_ddos_plan_enabled = length(azurerm_network_ddos_protection_plan.aks_vnet_ddos_protect) > 0
  aks_vnet_ddos_plan_id      = var.aks_advanced_networking_enabled && local.aks_vnet_ddos_plan_enabled ? azurerm_network_ddos_protection_plan.aks_vnet_ddos_protect.0.id == null ? azurerm_network_ddos_protection_plan.aks_vnet_ddos_protect.0.id : var.aks_vnet_ddos_id : null

  // ***************************************************
  // APPLICATION GATEWAY naming conventions 
  // ***************************************************
  aks_app_gw_target_name                                = lower("app-gw-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  appgw_user_assigned_identity_target_name              = "app-gw-user-identity-${lower(var.short_project_name)}-${lower(var.env_code)}"
  // App Gw FrontEnd Public IP 
  aks_app_gateway_frontend_public_ip_target_name        = lower("appgw-frontend-public-ip-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  # aks_app_gw_gateway_ip_config_name_target_name         = lower("${local.aks_cluster_target_name}-app-gw-ipconfig")

  # # aks_app_gw_httpfrontend_port_target_name            = lower("${local.aks_cluster_target_name}-app-gw-httpfrontendport") // pas de http ; que du https
  # aks_app_gw_httpsfrontend_port_target_name             = lower("${var.short_project_name}-${var.env_code}-frontend-port")
  # aks_app_gw_frontend_ip_configuration_target_name      = lower("${var.short_project_name}-${var.env_code}-app-gw-httpsfrontendport")     
  # aks_app_gw_backend_address_pool_target_name           = lower("${var.short_project_name}-${var.env_code}-app-gw-backendaddresspool")
  # aks_app_gw_backend_http_settings_target_name          = lower("${var.short_project_name}-${var.env_code}-app-gw-backendhttpsettings")

  # aks_app_gw_backend_http_settings_affinity_cookie_name = lower("${var.short_project_name}-${var.env_code}-app-gw-affinity-cookie")
  # backend_http_settings_probe_target_name               = lower("${var.short_project_name}-${var.env_code}-aks-backend-http-probe")

  frontend_port = lower("app-gw-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-frontend-port")
  // test the simple deployment (tmp)
  backend_address_pool_name      = "${var.short_project_name}-${var.env_code}-beap"
  frontend_port_name             = "${var.short_project_name}-${var.env_code}-feport"
  frontend_ip_configuration_name = "${var.short_project_name}-${var.env_code}-feip"
  http_setting_name              = "${var.short_project_name}-${var.env_code}-be-htst"
  listener_name                  = "${var.short_project_name}-${var.env_code}-httplstn"
  request_routing_rule_name      = "${var.short_project_name}-${var.env_code}-rqrt"
  app_gateway_subnet_name        = "appgwsubnet"

  // ***************************************************
  // LOG ANALYTICS WORKSPACE naming conventions 
  // ***************************************************
  law_target_name                                       = lower("law-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

  # aks_diag_target_name                                  = lower("${var.short_project_name}-${var.env_code}-diagnotics_settings")




  


}


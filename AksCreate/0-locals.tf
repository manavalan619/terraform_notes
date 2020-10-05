# ========================================================================
# Data sources and locals
# ========================================================================

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
# used to retreive tenant_id (+ object_id the the sp terraform) from the current client config
data "azurerm_client_config" "current" {}

// Retrieve SUFFIX secret value for akv target name
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

locals {

  // akv mgt
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // subnets target names in aks vnet (the character "-"" is not authorized for a subnet name)
  aks_kubesubnet_target_name  = lower("kubesubnet")
  aks_sqlsubnet_target_name   = lower("sqlsubnet")
  aks_apimsubnet_target_name  = lower("apimsubnet")
  aks_appgwsubnet_target_name = lower("appgwsubnet")
  aks_resource_index          = lower("aks")

  // appgw_frontend_public_ip target names
  apip_domain_name_label_target_name = lower("appgw-publicip-domain-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

  // apim
  apim_publisher_target_name         = lower("apim-publisher-${var.env_code}-${var.short_project_name}")

}
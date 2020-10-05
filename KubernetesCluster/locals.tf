# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
data "azurerm_client_config" "current" {}

# retrieve the last version of Kubernetes supported by AKS, based on the location of the RG project.
data "azurerm_kubernetes_service_versions" "current" {
  location = data.azurerm_resource_group.project_resource_group.location
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

# retreive aks-aad-server-app-id secret value
data "azurerm_key_vault_secret" "aks-aad-server-app-id" {
  name         = "aks-aad-server-app-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# retreive aks-aad-server-app-psw secret value
data "azurerm_key_vault_secret" "aks-aad-server-app-psw" {
  name         = "aks-aad-server-app-psw"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# retreive aks-sp-client-id secret value
data "azurerm_key_vault_secret" "aks-sp-client-id" {
  name         = "aks-sp-client-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# retreive aks-sp-psw secret value
data "azurerm_key_vault_secret" "aks-sp-psw" {
  name         = "aks-sp-psw"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# retreive aks-sp-psw secret value
data "azurerm_key_vault_secret" "aks-sp-internal-id" {
  name         = "aks-sp-internal-id"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# ========================================================================
# Manage internal rules 
# ========================================================================
locals {

  // akv mgt
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  resource_name             = lower("aks-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  aks_admin_target_username = lower("aks-admin-${var.env_code}-${var.short_project_name}")
}
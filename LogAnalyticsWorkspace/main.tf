# ========================================================================
# Data sources
# ========================================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# retreive static suffix value
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name 
  resource_group_name = local.rg_tf_name 
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
# reference the dedicated akv storing the AKS secret (aks server app ; aks client app and sp aks secrets)
data "azurerm_key_vault" "akv_mgt_aks_secrets" {
  name                = local.akv_aks_mgt 
  resource_group_name = local.rg_aks_mgt
} 

# ========================================================================
# Manage internal rules 
# ========================================================================
locals {

  // AKV MGT
  rg_tf_name              = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name             = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")
  // AKV AKS
  rg_aks_mgt              = local.rg_tf_name
  akv_aks_mgt             = local.akv_tf_name

  // TARGET LOG ANALYTICS WORKSPACE RESOURCE NAME 
  // (naming convention with static suffix included)
  law_target_name          = lower("law-aks-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")  

}

# ========================================================================
# Creates a Log Analytics Worskpace
# ========================================================================
resource "azurerm_log_analytics_workspace" "law" {
  # name                = local.law_target_name
  name                = var.law_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  sku                 = var.law_sku_name
  retention_in_days   = var.law_retention_in_days
  tags                = data.azurerm_resource_group.project_resource_group.tags
}